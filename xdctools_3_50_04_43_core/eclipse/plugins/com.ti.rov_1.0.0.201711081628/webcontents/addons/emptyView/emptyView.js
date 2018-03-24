/*
 *  ======== emptyView.js ========
 *  Empty example template for an ROV2 addon element
 *
 *  See also:
 *      https://www.polymer-project.org/1.0/docs/devguide/feature-overview
 */

/* Polymer element registration */
Polymer({
    /* identify this code's element: must match <dom-module> id */
    is: "xdc-rov-polymerUI-examples-emptyView",

    /* common view behaviors. See ti-rov-behaviors.html for reference */
    behaviors: [rovBehaviors.viewBehaviors],

    /* properties for this element's public API */
    properties: {

        viewName: {    /* required read-only view name: shown in addon menu */
          type:  String,
          value: "Empty Example"
        },

        viewRefresh: { /* recommended view state indicator */
          type:  Boolean,
          value: false
      }
    },

    /* properties and methods on the element's prototype */

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

        /* Process your data here */

        /* show the refresh button and hide the refresh spinner */
        if (this.viewRefresh) {
            this.viewRefresh = false;
        }

        /* handle data acquisition error (if any) */
        if (error != null) {
            return;
        }
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        /* hide the refresh button and show the refresh spinner */
        this.viewRefresh = true;

        /*
         *  Request ROV data via rovData.getView. For example:
         *      this.rovData.getView("ti.sysbios.utils.Load", "Module", this);
         *  This is an asynchronous call; getViewCallback() will be called
         *  with the result in its viewData parameter.
         *  this.viewRefresh should be set to "false" in getViewCallback() to
         *  hide the refresh spinner and show the refresh button
         */
    },

   /*
    *  ======== onSaveView ========
    *  Called when user clicks the 'Download' button on this view,
    *  or the 'Download all' button on the ROV toolbar
    */
    onSaveView: function () {
        return ({});
    },

    /*
     *  ======== ready ========
     *  Called by Polymer after property values are set and the local DOM
     *  is initialized.
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

    },

    /*
     *  ======== resizerClicked ========
     *  Called on a bottom corner on-mousedown event
     *
     *  See emptyView.html resizer div.
     */
    resizerClicked: function (e) {
        /*
         *  call polymerUI/src/rovUtils.js initRovResize(), passing the
         *  viewPaperCard element that is being resized. initRovResize()
         *  also takes an optional resized() callback parameter if any
         *  content in this view requires manual resizing logic to go
         *  along with the containing viewPaperCard element being resized
         */
        rovUtils.initRovResize(e, this.$.viewPaperCard);
    }
});
