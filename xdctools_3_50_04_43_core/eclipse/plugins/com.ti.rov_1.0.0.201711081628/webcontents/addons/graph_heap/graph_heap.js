/*
 *  ======== graph_heap.js ========
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
    is: "xdc-rov-polymerUI-examples-graph_heap",

    /* common view behaviors. See ti-rov-behaviors.html for reference */
    behaviors: [rovBehaviors.viewBehaviors],

    /* properties for this element's public API */
    properties: {

        rows: {        /* the values being plotted */
          type:  Array,
          value: []
        },

        maxFree: {
            type:  Number,
            value: 0
        },

        viewName: {     /* required read-only view name: shown in addon menu */
          type:  String,
          value: "Heap Graph"
        },

        viewRefresh: {  /* recommended view state indicator */
          type:  Boolean,
          value: false
        },

        sample: {       /* sample number */
            type:  Number,
            value: 0
        },

        /* threshold for removing rows from the chart */
        MAX_ROWS: {     /* max number of rows to display */
            type:  Number,
            value: 2048
        },

        traces : {       /*  plotly line traces */
            type: Array,
            value: null
        },

        layout : {      /*  plotly layout */
            type: Object,
            value: null
        },

        VISIBLE_ROWS: { /* visible x axis */
            type:  Number,
            value: 101
        },

        maxTotal : {    /* track y axis max to update range accordingly */
            type:  Number,
            value: 100
        }
    },

    /* methods on the element's prototype */

    /*
     *  ======== plotNewData ========
     *  Add a new value to the line graph
     */
    plotNewData: function (total, maxContig) {

        /* add row to both our data set and the graph's */
        this.rows[0].x.push(this.sample);
        this.rows[0].y.push(total);
        this.rows[1].x.push(this.sample);
        this.rows[1].y.push(maxContig);
        ++this.sample;

        /* limit total number of rows */
        if (this.rows[0].x.length > this.MAX_ROWS) {
            /* remove "oldest" row from our array and the data table */
            this.rows[0].x.splice(0, 1);
            this.rows[0].y.splice(0, 1);
            this.rows[1].x.splice(0, 1);
            this.rows[1].y.splice(0, 1);
        }
        this.traces[0].x = this.rows[0].x;
        this.traces[0].y = this.rows[0].y;
        this.traces[1].x = this.rows[1].x;
        this.traces[1].y = this.rows[1].y;

        if (this.rows[0].x.length > this.VISIBLE_ROWS) {
            this.updateVisibleXAxisRange(); /* always show latest data */
        }

        /* reset yaxis range, if necessary */
        if (total > this.maxTotal) {
            this.maxTotal = total;
            this.layout.yaxis.range = [0, this.maxTotal];
        }

        /* update graph's x-axis (if necessary) and redraw it */
        Plotly.update(this.$.graph, this.traces, this.layout);
    },

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
        /* show the refresh button and hide the refresh spinner */
        if (this.viewRefresh) {
            this.viewRefresh = false;
        }

        /* handle data acquisition error (if any) */
        if (error != null) {
            return;
        }

        /* track reported total to detect freelist list race anomilies */
        var total = Number(viewData[0].totalSize);
        var totalFree = Number(viewData[0].totalFreeSize);
        var maxContig = Number(viewData[0].largestFreeSize);

        /* plot total free space on graph */
        if (totalFree <= total) {
            this.plotNewData(totalFree, maxContig);
        }
        else {
            console.log("bogus total free = " + viewData[0].totalFreeSize);
        }
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        /*
         *  Request HeapMem details from an ROV view.
         *
         *  This is an asynchronous call; getViewCallback() will be called
         *  with the result in its viewData parameter.
         *  getViewCallback() returns null if a previous call from
         *  this view is pending.
         *
         *  this.viewRefresh hides/shows the refresh button and the
         *  refresh spinner.
         */
        this.viewRefresh = this.rovData.getView(
                "ti.sysbios.heaps.HeapMem", "Detailed", this)
                != null;
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
        if (this.trace != null) {
            return;
        }
        var graph = this.$.graph;

        /* set the graph to its min size */
        graph.style.width = '390px';
        graph.style.height = '264px';

        /* initialize all our state */
        this.rows = [{x:[], y:[]}, {x:[], y:[]}];

        this.traces = [{}, {}];

        this.traces[0] = {x: [0],
                          y: [0],
                          type: 'scatter',
                          mode: 'lines',
                          marker: {color: 'darkgreen'},
                          name: 'Total free'
        };
        this.traces[1] = {x: [0],
                          y: [0],
                          type: 'scatter',
                          mode: 'lines',
                          marker: {color: '#e6ac00'},
                          name: 'Max contiguous'
        };
        this.layout = {
          xaxis: {
            title: 'Sample Number',
            showgrid: true,
            type: 'linear',
            range: [0, this.VISIBLE_ROWS - 1],
            tickmode: 'auto',
            nticks: 11,
            tickfont: {size: 11},
            titlefont: {size: 11}
          },
          yaxis: {
            title: 'Bytes',
            type: 'linear',
            range: [0, this.maxTotal],
            tickmode: 'auto',
            nticks: 4,
            tickfont: {size: 11},
            titlefont: {size: 11}
          },
          width: 390,
          height: 264,
          autosize: true,
          margin: {
            l: 60,
            r: 20,
            b: 50,
            t: 0
          },
          showlegend: true,
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

        Plotly.newPlot(graph, this.traces, this.layout, {displayModeBar: false, scrollZoom: true});
        this.onRefresh();
    },

    /*
     *  ======== resized ========
     *  Callback initially passed to rovUtils.initRovResize() from
     *  resizerClicked(). Called after the view has been resized,
     *  enabling us to resize the graph accordingly
     */
    resized: function () {
        /* get viewPaperCard defined via the element in graph_heap.html */
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
        this.VISIBLE_ROWS = Math.floor((width - 80) / 3.1) + 1;
        if (this.VISIBLE_ROWS > this.MAX_ROWS) {
            this.VISIBLE_ROWS = this.MAX_ROWS;
        }
        if (this.rows[0].x.length > this.VISIBLE_ROWS) {
            this.updateVisibleXAxisRange(); /* always show latest data */
        }
        else {
            this.layout.xaxis.range = [0, this.VISIBLE_ROWS - 1];
        }
        Plotly.update(this.$.graph, [this.trace], this.layout);
    },

    /*
     *  ======== resizerClicked ========
     *  Called on a bottom corner on-mousedown event
     *
     *  See graph_heap.html resizer div.
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
    },

    /*
     *  ======== updateVisibleXAxisRange ========
     *  Always show latest data
     *
     */
    updateVisibleXAxisRange : function () {
        this.layout.xaxis.range = [this.sample - this.VISIBLE_ROWS, this.sample - 1];
    }
});
