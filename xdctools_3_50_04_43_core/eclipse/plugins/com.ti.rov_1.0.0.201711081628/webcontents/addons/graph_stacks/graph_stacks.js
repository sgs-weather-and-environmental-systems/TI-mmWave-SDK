/*
 *  ======== graph_stacks.js ========
 *  Graph example template for an ROV2 addon element
 *
 *  See also:
 *      https://www.polymer-project.org/1.0/docs/devguide/feature-overview
 *  and for Plotly.js charts:
 *      https://plot.ly/javascript/
 */

/* Polymer element registration */
Polymer({
    /* identify this code's element: must match <dom-module> id */
    is: "xdc-rov-polymerUI-examples-graph_stacks",

    /* common view behaviors. See ti-rov-behaviors.html for reference */
    behaviors: [rovBehaviors.viewBehaviors],

    /* properties for this element's public API */
    properties: {

        graph: {       /* the google bar graph element */
          type:  Object,
          value: {}
        },

        rows: {        /* each row = array representing a group of bars */
          type:  Array,
          value: []
        },

        viewName: {    /* required read-only view name: shown in addon menu */
          type:  String,
          value: "Stacks Graph"
        },

        viewRefresh: { /* recommended view state indicator */
          type:  Boolean,
          value: false
        },

        hwiTotal: {       /* total HWI stack space used (bytes) */
            type:  Number,
            value: 0
        },

        taskTotal: {       /* total task stack space used (bytes) */
            type:  Number,
            value: 0
        },

        OVERFLOW_MSG: {
            type:  String,
            value: "Stack overflow likely corrupted adjacent data!"
        },

        traces : {        /*  plotly bar traces */
            type: Array,
            value: null
        },

        layout : {        /*  plotly layout */
            type: Object,
            value: null
        },

        taskArray : {     /* task data array */
            type: Array,
            value: null
        },

        hwiRow : {        /* hwi data array */
            type: Array,
            value: null
        },

        requests: {        /* outstanding requests */
            type: Number,
            value: 0
        }
    },

    /* methods on the element's prototype */

    /*
     *  ======== getViewCallback ========
     *  Callback from rovData.getView()
     *
     *  Params
     *    error      - null when there is no error; otherwise an error
     *                 message string
     *    viewData   - the ROV view data requested as a JSON object
     *    moduleName - module name string for the returned view data
     *    viewName   - view name string for the returned view data
     */
    getViewCallback: function (error, viewData, moduleName, viewName) {
        if (--this.requests == 0 && this.viewRefresh) {
            /* show the refresh button and hide the refresh spinner */
            this.viewRefresh = false;
        }

        /* handle data acquisition error (if any) */
        if (error != null) {
            return;
        }

        /* create rows representing the data to display */
        if (viewName == "Detailed") {
            /* handle Task Details viewData */
            this.taskArray = this._genTaskArray(viewData);
        }
        else if (viewName == "Module") {
            /* handle Task Module viewData */
            this.hwiRow = this._genHwiRow(viewData);
        }
        if (this.hwiRow != null && this.taskArray != null) {
            this.layout.annotations = [];
            var annotation = {showarrow: false, font: {color: 'white'}};
            annotation.x = this.hwiRow[0];
            if (this.hwiRow[2] != '') {  /* used */
                annotation.y = this.hwiRow[1] - .06;
                annotation.text = this.hwiRow[2];
            }
            else if (this.hwiRow[5] != '') {  /* overflow */
                annotation.y = 0.94;
                annotation.text = this.hwiRow[5];
            }
            this.layout.annotations.push(annotation);

            var hoverText = [this.hwiRow[6]];
            var tracesX = [this.hwiRow[0]];
            for (var i = 0; i < this.taskArray.length; i++) {
                tracesX.push(this.taskArray[i][0]);

                var annotation = {showarrow: false, font: {color: 'white'}};
                annotation.x = this.taskArray[i][0];
                if (this.taskArray[i][2] != '') {  /* used */
                    annotation.y = this.taskArray[i][1] - .06;
                    annotation.text = this.taskArray[i][2];
                }
                else if (this.taskArray[i][5] != '') {  /* overflow */
                    annotation.y = 0.94;
                    annotation.text = this.taskArray[i][5];
                }
                this.layout.annotations.push(annotation);
                hoverText.push(this.taskArray[i][6]);
            }
            var tracesY = [[], [], [], []];
            tracesY[0].push(this.hwiRow[1]);
            tracesY[1].push(this.hwiRow[3]);
            if (this.hwiRow[4] != 0) {  /* overflow */
                tracesY[2].push(.75);
                tracesY[3].push(.25);
            }
            else {
                tracesY[2].push(0);
                tracesY[3].push(0);
            }
            for (i = 0; i < this.taskArray.length; i++) {
                tracesY[0].push(this.taskArray[i][1]);
                tracesY[1].push(this.taskArray[i][3]);
                if (this.taskArray[i][4] != 0) { /* overflow */
                    tracesY[2].push(.75);
                    tracesY[3].push(.25);
                }
                else {
                    tracesY[2].push(0);
                    tracesY[3].push(0);
                }
            }
            for (i = 0; i < this.traces.length; i++) {
                this.traces[i].x = tracesX;
                this.traces[i].y = tracesY[i];
            }
            this.traces[2].hovertext = hoverText;

            /* update hAxis title to show total stack usage */
            this.layout.xaxis.title = "Stack (Total used: "
                + (this.taskTotal + this.hwiTotal) + " Bytes)";
            this.layout.xaxis.showticklabels = true;

            /* update graph with latest data */
            Plotly.update(this.$.graph, this.traces, this.layout);
        }
    },

    /*
     *  ======== _genHwiRow ========
     */
    _genHwiRow: function (viewData) {
        var size = viewData.hwiStackSize - 0;
        var peak = viewData.hwiStackPeak - 0;

        var overflow = 0;
        var used, free;
        if (peak >= size) {
            used = free = 0;
            overflow = 1;
        }
        else {
            used = peak / size;
            free = 1 - used;
        }

        /* create the row for display */
        var row = ["ISR Stack", used, peak + " B", free, overflow, "", ""];
        if (overflow == 1) {
            row[2] = "";                 /* remove annotation for % used */
            row[5] = "> " + size + " B"; /* annotate overflow */
            row[6] = this.OVERFLOW_MSG;  /* overflow tooltip */
        }

        /* update latest ISR stack usage */
        this.hwiTotal = peak - 0;

        return (row);
    },

    /*
     *  ======== _genTaskArray ========
     */
    _genTaskArray: function (viewData) {
        var taskArray = [];
        var total = 0;

        /* create rows representing the data to display */
        for (var i = 0; i < viewData.length; i++) {
            var task = viewData[i];
            var size = task.stackSize - 0;
            var peak = task.stackPeak - 0;

            var elem = ["", 0, peak + " B", 0, 0, "", ""];
            elem[0] = task.label == "" ? task.fxn[0] : task.label;
            if (elem[0]) { /* trim long names */
                var k = elem[0].lastIndexOf('.');
                if (k > 10) {
                    elem[0] = elem[0].substr(k + 1);
                }
            }

            if (size == 0) { /* pre-initialized task */
                elem[1] = 1;                  /* used */
                elem[3] = 0;                  /* free */
                elem[4] = 0;                  /* overflow */
            }
            else if (peak >= size) {
                elem[1] = elem[3] = 0;        /* overflow detected! */
                elem[2] = "";                 /* clear used annotation */
                elem[4] = 1;                  /* set overflow to 100% */
                elem[5] = "> " + size + " B"; /* overflow annotation */
                elem[6] = this.OVERFLOW_MSG;  /* overflow tooltip */
            }
            else {
                elem[1] = peak / size;        /* used */
                elem[3] = 1 - elem[1];        /* free */
                elem[4] = 0;                  /* overflow */
            }
            taskArray.push(elem);
            total += peak;
        }

        /* sort task stack results by "stack name" */
        taskArray.sort(function (a, b) {
            if (a[0] < b[0]) {
                return 1;
            }
            else if (a[0] > b[0]) {
                return (-1);
            }
            return (0);
        });

        /* update latest total task stack usage */
        this.taskTotal = total;

        return (taskArray);
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        this.hwiRow = null;
        this.taskArray = null;

        /*
         *  Request Task Details ROV view.
         *
         *  This is an asynchronous call; getViewCallback() will be called
         *  with the result in its viewData parameter.
         *  getViewCallback() returns null if a previous call from
         *  this view is pending.
         */
        if (this.rovData.getView("ti.sysbios.knl.Task", "Detailed", this)) {
            ++this.requests;
        }

        /* also request Task Module to get HWI stack usage */
        if (this.rovData.getView("ti.sysbios.knl.Task", "Module", this)) {
            ++this.requests;
        }

        /* hide the refresh button and show the refresh spinner */
        this.viewRefresh = this.requests > 0;
    },

   /*
    *  ======== onSaveView ========
    *  Called when user clicks the 'Download' button on this view,
    *  or the 'Download all' button on the ROV toolbar
    */
    onSaveView: function () {
        /* return the graph's current data set */
        return (this.rows);
    },

    /*
     *  ======== attached ========
     *  Called by Polymer after the element is attached to the document.
     *  Can be called multiple times during the lifetime of an element.
     *  The first `attached` callback is guaranteed not to fire until after `ready`.
     *
     *  ti-rov-panel is the global container element for ROV.  It has
     *  already retrieved the modules and view list, so we can get these
     *  directly from there instead of making a redundant asynchronous
     *  calls into ti-rov-data.
     *
     *  To get the ti-rov-panel element:
     *        var rovPanel = document.querySelector('ti-rov-panel');
     */
    attached: function () {
        if (this.traces != null) {
            return;
        }
        this.traces = [{}, {}, {}, {}];

        /* % Used trace */
        this.traces[0] = {
          x: [''],
          y: [0],
          name: '% Used',
          type: 'bar',
          marker: {color: 'blue'},
          showlegend: true,
          hoverinfo: 'skip'
        };

        /* % Free trace */
        this.traces[1] = {
          x: [''],
          y: [0],
          name: '% Free',
          type: 'bar',
          marker: {color: '#e6ac00'},
          showlegend: true,
          hoverinfo: 'skip'
        };

         /* Overflow trace */
        this.traces[2] = {
          x: [''],
          y: [0],
          name: 'Overflow',
          type: 'bar',
          marker: {color: 'red'},
          showlegend: true,
          hoverinfo: 'text+skip'
        };

        /* this trace is a hack to position the overflow tooltip */
        this.traces[3] = {
          x: [''],
          y: [0],
          name: 'Overflow2',
          type: 'bar',
          marker: {color: 'red'},
          showlegend: false,
          hoverinfo: 'skip'
        };

        this.layout = {
          barmode: 'stack',
          hovermode: 'closest',
          width: 390,
          height: 264,
          autosize: true,
          margin: {
            l: 60,
            r: 20,
           // b: 50,
            t: 0,
            autoexpand: true
          },
          xaxis: {
            title: 'Stack',
            showticklabels: false,
            fixedrange: true,
            tickfont: {size: 10},
            titlefont: {size: 11}
          },
          yaxis: {
            range: [0, 1],
            type: 'array',
            tickvals: [0, .25, .50, .75, .90, 1],
            ticktext: ['0%', '25%', '50%', '75%', '90%', '100%'],
            fixedrange: true,
            tickfont: {size: 11},
            titlefont: {size: 11}
          },
          annotations: [],
          legend: {
            x: 0,
            y: 1,
            'orientation': 'h',
            'traceorder': 'normal',
            'yanchor': 'bottom',
            'xanchor': 'left',
            font: {size: 11}
          }
        };
        Plotly.newPlot(this.$.graph, this.traces, this.layout, {displayModeBar: false});
        this.onRefresh();
    },

    /*
     *  ======== resized ========
     *  Callback initially passed to rovUtils.initRovResize() from
     *  resizerClicked(). Called after the view has been resized,
     *  enabling us to resize the graph accordingly
     */
    resized: function () {
        /* get viewPaperCard defined via the element in graph_stacks.html */
        var viewPaperCard = this.$.viewPaperCard;
        var graph = this.$.graph;

        /* get the new width and height from viewPaperCard's style */
        var width = Number(viewPaperCard.style.width.slice(0, -2));
        var height = Number(viewPaperCard.style.height.slice(0, -2));

        /* get viewPaperCard minWidth and minHeight */
        var minWidth = Number(viewPaperCard.style.minWidth.slice(0, -2));
        var minHeight = Number(viewPaperCard.style.minHeight.slice(0, -2));

        /* Don't let new size go below the defined minimums */
        width = Math.max(width, minWidth) * .95;
        height = Math.max(height, minHeight) * .85;

        /* Scale the graph accordingly */
        graph.style.width = width + 'px';
        graph.style.height = height + 'px';

        /* update the graph and redisply it */
        this.layout.width = width;
        this.layout.height = height;
        Plotly.update(this.$.graph, [this.traces], this.layout);
    },

    /*
     *  ======== resizerClicked ========
     *  Called on a bottom corner on-mousedown event
     *
     *  See graph_stacks.html resizer div.
     */
    resizerClicked: function (e) {
        /*
         *  call polymerUI/src/rovUtils.js initRovResize(), passing the
         *  viewPaperCard element that is being resized. Also pass callback
         *  object in order to be notified via this.resized() when the element
         *  is done being is resized, so we can make any required size related
         *  changes to the graph itself
         */
        rovUtils.initRovResize(e, this.$.viewPaperCard, {elem: this, fxn: this.resized});
    }
});
