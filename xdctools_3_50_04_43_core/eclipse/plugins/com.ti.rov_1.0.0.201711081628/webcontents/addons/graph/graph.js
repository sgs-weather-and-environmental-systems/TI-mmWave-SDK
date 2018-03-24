/*
 *  ======== graph.js ========
 *  Graph example template for an ROV2 addon element
 *
 *  See also:
 *      https://www.polymer-project.org/1.0/docs/devguide/feature-overview
 *  and for Google Charts:
 *      https://elements.polymer-project.org/elements/google-chart
 */

/* Polymer element registration */
Polymer({
    /* identify this code's element: must match <dom-module> id */
    is: "xdc-rov-polymerUI-examples-graph",

    /* common view behaviors. See ti-rov-behaviors.html for reference */
    behaviors: [rovBehaviors.viewBehaviors],

    /* properties for this element's public API */
    properties: {

        graph: {       /* the google chart line graph element */
          type:  Object,
          value: {}
        },

        rows: {        /* the values being plotted */
          type:  Array,
          value: []
        },

        viewName: {    /* required read-only view name: shown in addon menu */
          type:  String,
          value: "CPU Graph"
        },

        viewRefresh: { /* recommended view state indicator */
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
            value: 1024
        }
    },

    /* methods on the element's prototype */

    /*
     *  ======== _chartReady ========
     *  This listener is fired when chart is ready for interaction.
     *
     *  We use this for the initial update when the graph is first
     *  opened. The google-charts docs say this listener is a 'one time'
     *  event, but it fires endlessly, so instead of simply assigning it
     *  in the html, we set it programatically in ready() and remove it
     *  here after one call.
     */
    _chartReady: function (chart) {
        /* remove listener used for intitial refresh */
        this.unlisten(this.$.graph, 'google-chart-render', '_chartReady');

        /* trigger our refresh of the data */
        this.onRefresh();
    },

    /*
     *  ======== addRow ========
     *  Add a new value to the line graph
     */
    addRow: function (val) {
        this.sample++;

        /* add row to both our data set and the graph's */
        this.rows.push([this.sample, val]);
        this.graph._dataTable.addRow([this.sample, val]);

        /* limit total number of rows */
        if (this.rows.length > this.MAX_ROWS) {
            /* remove "oldest" row from our array and the data table */
            this.rows.splice(0, 1);
            this.graph._dataTable.removeRow(0);
        }

        /* update graph's x-axis (if necessary) and redraw it */
        this.updateGraph(this.graph, this.rows);
    },

    /*
     *  ======== updateGraph ========
     *  Redraw the graph based on new data or new size
     */
    updateGraph: function (graph, data, nsamp) {
        /* if nsamp isn't defined, don't change # of samples to display */
        if (nsamp == null) {
            var view = graph.options.hAxis.viewWindow;
            nsamp = view.max - view.min;
        }

        /* compute first sample to display */
        var min = (data != null ? this.sample : 0) - nsamp;
        if (min < 0) {
            min = 0;
        }

        /* update graph's viewWindow to display latest values */
        graph.options.hAxis.viewWindow = {min: min, max: min + nsamp};

        /* redraw graph so changes become visible */
        graph.drawChart();
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

        /* plot cpuLoad on graph */
        this.addRow(Number(viewData.cpuLoad));
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        /*
         *  Request CPU load from an ROV view.
         *
         *  This is an asynchronous call; getViewCallback() will be called
         *  with the result in its viewData parameter.
         *  getViewCallback() returns null if a previous call from
         *  this view is pending.
         *
         *  this.viewRefresh hides/shows the refresh button and the
         *  refresh spinner.
         */
        this.viewRefresh = this.rovData.getView("ti.sysbios.utils.Load",
                "Module", this) != null;
    },

   /*
    *  ======== onSaveView ========
    *  Called when user clicks the 'Download' button on this view,
    *  or the 'Download all' button on the ROV toolbar
    */
    onSaveView: function () {
        /* return graph's current data set */
        return (this.rows);
    },

    /*
     *  ======== ready ========
     *  Called by Polymer when view is created but only after property values
     *  are set and the local DOM is initialized.
     *
     *  ti-rov-panel is the global container element for ROV.  It has
     *  already retrieved the modules and view list, so we can get these
     *  directly from there instead of making a redundant asynchronous
     *  calls into ti-rov-data.
     *
     *  To get the ti-rov-panel element:
     *        var rovPanel = document.querySelector('ti-rov-panel');
     */
    ready: function () {
        /*
         *  Configure the google-chart element. For reference, see:
         *      https://elements.polymer-project.org/elements/google-chart
         */
        var graph = this.$.graph;
        graph.options.vAxis = {minValue: 0, maxValue: 100};
        graph.options.vAxis.title = "% Utilization";

        graph.options.hAxis = {viewWindow: {min: 0, max: 25}};
        graph.options.hAxis.title = "Sample Number";

        /* define chart area */
        graph.options.chartArea = {top: 30, bottom: 40, left: 50, right: 40};

        /* enable horizontal scrolling via mouse drag */
        graph.options.explorer = {axis: 'horizontal'};

        /* place the legend at top-center */
        graph.options.legend = {position: 'top', alignment: 'center'};

        /* define line graph's data types and labels */
        graph.cols = [
            {"label": "Sample",  "type": "number"},
            {"label": "Total",   "type": "number"}];
        graph.rows = [[0,0]];

        /* set the graph to its min size */
        graph.style.width = '390px';
        graph.style.height = '264px';

        /* initialize all our state */
        this.graph = graph;
        this.rows = [];

        /* set listener for initial refresh */
        this.listen(this.$.graph, 'google-chart-render', '_chartReady');
    },

    /*
     *  ======== resized ========
     *  Callback initially passed to rovUtils.initRovResize() from
     *  resizerClicked(). Called after the view has been resized,
     *  enabling us to resize the graph accordingly
     */
    resized: function () {
        /* get viewPaperCard defined via the element in graph.html */
        var viewPaperCard = this.$.viewPaperCard;
        var graph = this.$.graph;

        /* get the new width and height from viewPaperCard's style */
        var width = Number(viewPaperCard.style.width.slice(0, -2));
        var height = Number(viewPaperCard.style.height.slice(0, -2));

        /* get viewPaperCard minWidth and minHeight */
        var minWidth = Number(viewPaperCard.style.minWidth.slice(0, -2));
        var minHeight = Number(viewPaperCard.style.minHeight.slice(0, -2));

        /* Don't let new size go below the defined minimums */
        width = Math.max(width, minWidth);
        height = Math.max(height, minHeight);

        /* Scale the graph accordingly */
        graph.style.width = (width * .95) + 'px';
        graph.style.height = (height * .85) + 'px';

        /* update the graph and redisply it */
        this.updateGraph(graph, this.rows, Math.floor(width / 20));
    },

    /*
     *  ======== resizerClicked ========
     *  Called on a bottom corner on-mousedown event
     *
     *  See graph.html resizer div.
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
