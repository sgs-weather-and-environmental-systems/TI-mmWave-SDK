/*
 *  ======== console.js ========
 *  Simple example of getting ROV data and printing it to a custom view
 *
 *  See also:
 *      https://www.polymer-project.org/1.0/docs/devguide/feature-overview
 */

/* Polymer element registration */
Polymer({
    /* identify this code's element: must match <dom-module> id */
    is: "xdc-rov-polymerUI-examples-console",

    /* common view behaviors. See ti-rov-behaviors.html for reference */
    behaviors: [rovBehaviors.viewBehaviors],

    /* properties for this element's public API */
    properties: {

        viewName: {    /* required read-only view name: shown in addon menu */
            type:  String,
            value: "Console Example"
        },

        viewRefresh: { /* recommended view state indicator */
            type:  Boolean,
            value: false
        },

        /* this addon element's state */
        refreshCount: { /* simple refresh request counter */
            type:  Number,
            value: 1
        },

        /* threshold for removing lines from the console log */
        MAX_CONSOLE_CHARS: { /* max number of characters in console display */
            type:  Number,
            value: 120 * 32 /* roughly 120 lines */
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
        /* show the refresh button and hide the refresh spinner */
        if (this.viewRefresh) {
            this.viewRefresh = false;
        }

        /* if the console is too long, remove a line before adding another */
        var tmp = this.$.console_output.innerHTML;
        if (tmp.length > this.MAX_CONSOLE_CHARS) {
            this.$.console_output.innerHTML = tmp.substr(tmp.indexOf('\n')+1);
        }

        /* handle data acquisition error (if any) */
        if (error != null) {
            this.$.console_output.innerHTML += error + "<br>\n";
            return;
        }

        /* write cpuLoad to console_output paragraph */
        this.$.console_output.innerHTML += this.refreshCount++
            + " cpu load = " + viewData.cpuLoad + "<br>\n";

        /* scroll to end of output */
        this.$.viewContentDiv.scrollTop = this.$.viewContentDiv.scrollHeight;
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
        /* return the console's current state */
        return (lines);
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
     *  See the "resizer" div in console.html.
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
