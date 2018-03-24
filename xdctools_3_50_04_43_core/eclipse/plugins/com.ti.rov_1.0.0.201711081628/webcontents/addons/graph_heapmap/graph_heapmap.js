/*
 *  ======== graph_heapmap.js ========
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
    is: "xdc-rov-polymerUI-examples-graph_heapmap",

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

        viewData: {    /* most recent view data object from target */
          type: Object,
          value: {}
        },

        viewName: {     /* required read-only view name: shown in addon menu */
          type:  String,
          value: "Heap Memory Map"
        },

        viewRefresh: {  /* recommended view state indicator */
          type:  Boolean,
          value: false
        },

        sample: {       /* sample number */
            type:  Number,
            value: 0
        },

        traces : {        /*  plotly bar traces */
            type: Array,
            value: null
        },

        layout : {        /*  plotly layout */
            type: Object,
            value: null
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
        /* show the refresh button and hide the refresh spinner */
        if (this.viewRefresh) {
            this.viewRefresh = false;
        }

        /* handle data acquisition error (if any) */
        if (error != null  || viewData.length < 1) {
            return;
        }

        console.log(JSON.stringify(viewData, null, '\t'));

        this.viewData = viewData;

        var traces = [];
        var totalFree = 0;
        var totalFreeBlocks = 0;
        for (var i = 0; i < viewData.length; i++) {
            var heap = viewData[i];

            /* populate row data for this heap
             *     heap.elements is an array of objects:
             *         {Address, size, next, status:("Free" | "In Use")}
             */
            var sizes = [];
            var used = 0, free = 0, freeBlocks = 0;
            for (var j = 0; j < heap.elements.length; j++) {
                var trace = {orientation: 'h',
                             x: [0],
                             y: ['default'],
                             type: 'bar',
                             hoverinfo: 'skip+text',
                             width: 1
                };
                trace.showlegend = j < 2;
                var block = heap.elements[j];
                var type = "free";
                if (block.status == "Free") {
                    free += Number(block.size);
                    freeBlocks++;
                    trace.marker = {color: '#e6ac00'};
                    trace.name = j < 2 ? 'Free' : '';
                }
                else {
                    used += Number(block.size);
                    type = "used";
                    trace.marker = {color: 'blue'};
                    trace.name = j < 2 ? 'In Use' : '';
                }
                trace.text = Number(block.size) + " Bytes " + type
                             + " (@" + block.Address + ")" /* hover tooltip */
                traces.push(trace);
                sizes.push(Number(block.size));       /* size value */
            }

            /* update global totals */
            totalFree += free;
            totalFreeBlocks += freeBlocks;

            /* scale the data for a relative plot */
            var total = used + free;

            /* adjust any very very small sizes to make them visible */
            var newTotal = total;
            for (j = 0; j < sizes.length; j++) {
                if ((sizes[j] / total) < .006) {
                    var min = Math.round(.006 * total);
                    var adjust = min - sizes[j];
                    sizes[j] += adjust;
                    newTotal += adjust;
                }
            }
            total = newTotal;

            for (j = 0; j < sizes.length; j++) {
                traces[j].x[0] = (sizes[j] / total);
            }
        }
        /* update xaxis title to show total heap free space */
        this.layout.xaxis.title = "Memory Map (Total free: "
            + totalFree + " Bytes in " + totalFreeBlocks + " blocks)";

        /* redraw graph so changes become visible */
        Plotly.purge(this.$.graph);
        this.traces = traces;
        Plotly.newPlot(this.$.graph, this.traces, this.layout, {displayModeBar: false});
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        /*
         *  Request HeapMem freelists from an ROV view.
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
                "ti.sysbios.heaps.HeapMem", "FreeList", this)
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
        if (this.traces != null) {
            return;
        }
        this.traces = [{}, {}];

        /*In Use trace */
        this.traces[0] = {name: 'In Use',
                          orientation: 'h',
                          x: [0],
                          y: ['default'],
                          type: 'bar',
                          marker: {color: 'blue'},
                          showlegend: true,
                          hoverinfo: 'skip+text',
                          width: 1
        };

        /* Free trace */
        this.traces[0] = {name: 'Free',
                          orientation: 'h',
                          x: [0],
                          y: ['default'],
                          type: 'bar',
                          marker: {color: '#e6ac00'},
                          showlegend: true,
                          hoverinfo: 'skip+text',
                          width: 1
        };
        this.layout = {
          barmode: 'stack',
          hovermode: 'closest',
          width: 390,
          height: 264,
          autosize: true,
          margin: {
            l: 50,
            r: 18,
            b: 50,
            t: 0
          },
          xaxis: {
            title: 'Memory Map',
            range: [0, 1],
            type: 'array',
            tickvals: [0, .25, .50, .75, 1],
            ticktext: ['0%', '25%', '50%', '75%', '100%'],
            ticks: 'outside',
            ticklen: 10,
            fixedrange: true,
            tickfont: {size: 11},
            titlefont: {size: 11}
          },
          yaxis: {
            title: 'Heap',
            tickangle: -90,
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
        /* get viewPaperCard defined via the element in graph_heapmap.html */
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
     *  See graph_heapmap.html resizer div.
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
