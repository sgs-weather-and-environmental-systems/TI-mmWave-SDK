/*
 *  ======== shell.js ========
 *  An example of a primitive interactive shell to get and display ROV data
 *
 *  See also:
 *      https://www.polymer-project.org/1.0/docs/devguide/feature-overview
 */

/* Polymer element registration */
Polymer({
    /* identify this code's element: must match <dom-module> id */
    is: "xdc-rov-polymerUI-examples-shell",

    /* common view behaviors. See ti-rov-behaviors.html for reference */
    behaviors: [rovBehaviors.viewBehaviors],

    /* properties for this element's public API */
    properties: {

        viewName: {    /* required read-only view name: shown in addon menu */
            type:  String,
            value: "Shell Example"
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

        historyPos: {
            type:  Number,
            value: 0
        },

        history: {
            type:  Array,
            value: function() { return [];}
        },

        /* threshold for removing lines from the shell log */
        MAX_CONSOLE_CHARS: { /* max number of characters in shell display */
            type:  Number,
            value: 120 * 32 /* roughly 120 lines */
        },

        /* input command help */
        HELP: {
            type: String,
            value: "valid commands:\n" +
                 "  g &lt;mod&gt;[&lt;view&gt;]\n" +
                 "           - display &lt;mod&gt's view &lt;view&gt;\n" +
                 "  l        - display CPU load\n" +
                 "  n &lt;addr&gt;[, &lt;radius&gt;[, &lt;{fxn,data,any}&gt;]]\n" +
                 "           - display program symbols whose value is\n" +
                 "             &lt;addr&gt; plus or minus &lt;radius&gt; and are\n" +
                 "             of the specified type: fxn or data\n" +
                 "  r &lt;addr&gt;[, &lt;len&gt; [, &lt;check&gt;]]\n" +
                 "           - display &lt;len&gt bytes from &lt;addr&gt;\n" +
                 "             with address checks unless &lt;check&gt is\n" +
                 "             set to false\n" +
                 "  s        - display section memory map\n" +
                 "  clear    - clear shell output\n" +
                 "  help, ?  - list valid commands\n\n" +
                 "commands prefixed by a number followed by a\n" +
                 "space will be repeated that number of times\n"
        }
    },

    /* properties and methods on the element's prototype */

    /*
     *  ======== _usage ========
     *  Display msg and general usage (with specified indent prefix on
     *  each line to console output
     */
    _usage: function (msg, indent) {
        indent = indent == null ? "" : indent;

        /* compose complete message content */
        var content = (msg + this.HELP).replace(/\n/g, "\n" + indent);

        /* display content */
        this.$.shell_output.innerHTML += "<pre>" + content + "</pre>";

        /* scroll to the bottom of output */
        var outDiv = this.$.viewContentDiv;
        outDiv.scrollTop = outDiv.scrollHeight;
    },

    /*
     *  ======== _eval ========
     *  Run specified command and return string to put into history
     */
    _eval: function (cmd) {
        if (cmd == null) {
            cmd = "";
        }

        if (cmd != "") {
            var count = 1;
            /* parse and start specified command */
            var tokens = cmd.match(/([0-9]+\s+)?(.*$)/);

            if (tokens[1] != null) {
                /* if there's a leading count, repeat the cmd's suffix */
                count = Number(tokens[1]);
                if (isFinite(count) && count > 0) {
                    while (count-- > 0) {
                        this._eval(tokens[2]);
                    }
                }
            }
            else if (cmd == "clear") {
                this.$.shell_output.innerHTML = "";
            }
            else if (cmd == "help" || cmd == "?") {
                this._usage("");
            }
            else if (cmd.match(/^s[ \t]*$/)) {
                this.viewRefresh = true; /* show the refresh spinner */
                this.rovData.getView("xdc.rov.runtime.Monitor", "Sections", this);
            }
            else if (cmd == "l") {
                this.viewRefresh = true; /* show the refresh spinner */
                this.rovData.getView("ti.sysbios.utils.Load", "Module", this);
            }
            else if (cmd.indexOf("n ") == 0) {
                this.viewRefresh = true; /* show the refresh spinner */
                this.rovData.getView("xdc.rov.runtime.Monitor",
                                     "Symbols:" + cmd.substr(2), this);
            }
            else if (cmd.indexOf("r ") == 0) {
                this.viewRefresh = true; /* show the refresh spinner */
                this.rovData.getView("xdc.rov.runtime.Monitor",
                                     "UChar:" + cmd.substr(2), this);
            }
            else if (cmd.indexOf("g ") == 0) {
                this.viewRefresh = true; /* show the refresh spinner */
                tokens = cmd.substr(2).split(/\s+/);
                var view = tokens[1] == null ? "Raw" : tokens[1];
                this.rovData.getView(tokens[0], view, this);
            }
            else {
                this._usage("Illegal command: '" + cmd + "'\n", "  ");
                cmd = "";
            }
        }

        /* return command string to add to history */
        return (cmd);
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

        /* if the shell is too long, remove a line before adding another */
        var tmp = this.$.shell_output.innerHTML;
        if (tmp.length > this.MAX_CONSOLE_CHARS) {
            this.$.shell_output.innerHTML = tmp.substr(tmp.indexOf('\n') + 1);
        }

        /* handle data acquisition error (if any) */
        if (error != null) {
            this.$.shell_output.innerHTML += "<pre>" + error + "</pre>";

            /* scroll to the bottom of output */
            var outDiv = this.$.viewContentDiv;
            outDiv.scrollTop = outDiv.scrollHeight;
            return;
        }

        var output = "";
        if (moduleName == "ti.sysbios.utils.Load") {
            /* format CPU load output */
            output += this.refreshCount++
                + " cpu load = " + viewData.cpuLoad;
        }
        else if (moduleName == "xdc.rov.runtime.Monitor") {
            if (viewName == "Sections") {
                /* format memory sections output */
                for (var i = 0; i < viewData.elements.length; i++) {
                    var row = viewData.elements[i];
                    var start = "00000000" + Number(row.start).toString(16);
                    var end = "00000000" + Number(row.end).toString(16);
                    output += row.name + ": "
                        + "start = 0x" + start.substr(-8)
                        + ", end = 0x" + end.substr(-8)
                        + ", len = " + Number(row.len) + "\n";
                }
            }
            else if (viewName.indexOf("Symbols") == 0) {
                for (var i = 0; i < viewData.elements.length; i++) {
                    var row = viewData.elements[i];
                    var start = "00000000" + Number(row.addr).toString(16);
                    var type = String(row.type);
                    output += row.name + ": "
                        + "addr = 0x" + start.substr(-8)
                        + ", type = " + type + "\n";
                }
                if (viewData.elements.length == 0) {
                    output = viewName + ": ????\n";
                }
            }
            else {
                /* format memory values output */
                for (var i = 0; i < viewData.elements.length; i++) {
                    var row = viewData.elements[i];

                    /* format addresses with exactly 8-digits */
                    var tmp = "00000000" + Number(row.addr).toString(16);
                    output += tmp.substr(-8) + " ";

                    for (var j = 0; j < 8; j++) {
                        var value = row["byte" + j];
                        if (value == null) {
                            break;
                        }

                        /* format bytes with exactly 2 digits */
                        tmp = "00" + Number(value).toString(16);
                        output += tmp.substr(-2) + " ";
                    }
                    output += "\n";
                }
            }
        }
        else {
            output += moduleName + ":" + viewName + "\n";
            output += JSON.stringify(viewData, null, 4);
        }
        output = "<pre>" + output + "</pre>";

        /* display output */
        this.$.shell_output.innerHTML += output;

        /* scroll to the bottom of output */
        var outDiv = this.$.viewContentDiv;
        outDiv.scrollTop = outDiv.scrollHeight;
    },

    /*
     *  ======== onRefresh ========
     *  Called when user clicks the 'Refresh' button on this view,
     *  or 'Refresh all' or 'Repeat refresh' buttons on the ROV toolbar
     */
    onRefresh: function () {
        /* Run  the command in the input buffer (if any) */
        if (this.$.shell_input.value && this.$.shell_input.value != "") {
            this._eval(this.$.shell_input.value);
        }
    },

   /*
    *  ======== onSaveView ========
    *  Called when user clicks the 'Download' button on this view,
    *  or the 'Download all' button on the ROV toolbar
    */
    onSaveView: function () {
        /* create an object representing the shell's current state */
        var content = this.$.shell_output.innerHTML.replace(/<pre>/g, "");
        var lines = content.split(/<\/pre>/);
        return ({history: this.history, output: lines});
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
     *  ======== attached ========
     *  Called by Polymer after the UI is displayed to user
     */
    attached: function () {
        var shellStorage = rovUtils.getLocalStorageItem(this.name + "-storage");
        if (shellStorage && shellStorage.length > 0) {
            this.history = JSON.parse(shellStorage).history;
        }
        /* calling focus() in ready is not sufficient */
        this.$.shell_input.focus();
    },

    /*
     *  ======== resizerClicked ========
     *  Called on a bottom corner on-mousedown event
     *
     *  See the "resizer" div in shell.html.
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
    },

    /*
     *  ======== inputChanged ========
     *  Called when user interacts with the input element shell_input
     *
     *  See <input id="shell_input"> in ./shell.html
     */
    inputChanged: function (e) {
    },

    /*
     *  ======== inputKeydown ========
     *  Called when user interacts with the input element shell_input
     *
     *  See <input id="shell_input"> in ./shell.html
     */
    inputKeydown: function(e) {
        /* "parse" key events looking for command history control events */
        var delta = 0;

        if (e.which) {/* old webkit support */
            if (e.which == 13) {
                this._readAndClear();
            }
            else  {
                delta = this._historySelect(e, true);
            }
        }
        else {
            delta = this._historySelect(e);
        }

        if (delta != 0) {
            e.preventDefault(); e.stopPropagation();
        }

        if (delta != 0 && this.history.length > 0) {
            /* don't update position outside existing saved history */
            if ((this.historyPos <= 1 && delta < 0)
               || (this.historyPos == this.history.length && delta > 0)) {
                return;
            }

            this.historyPos += delta;

            /* compute index according to the the new history position */
            var index = this.history.length - this.historyPos;

            /* update shell_input */
            var cmd = this.history[index];
            this.$.shell_input.value = cmd;

            /* set cursor to end of line */
            var len = cmd.length;
            this.$.shell_input.focus();
            this.$.shell_input.setSelectionRange(len, len);
        }
    },

    /*
     *  ======== inputKeypress ========
     *  Called when user interacts with the input element shell_input
     *
     *  See <input id="shell_input"> in ./shell.html
     */
    inputKeypress: function (e) {
        if (e.key == "Enter") {
            this._readAndClear();
        }
    },

    /*
     *  ======== _historySelect ========
     *  Convert keyboard event e into a number indicating which history
     *  command to use (if any)
     */
    _historySelect: function (e, webkit) {
        var delta = 0;

        if (webkit) {
            if ((e.ctrlKey && e.which == 80)      /* ^P */
                 || e.which == 38) {              /* up arrow */
                delta = 1;
            }
            else if ((e.ctrlKey && (e.which == 14 || e.which == 78)) /* ^N */
                     || e.which == 40) {          /* down arrow */
                delta = -1;
            }
            //console.log("which key: " + e.which);
            //console.log("keyCode: " + e.keyCode);
            //console.log("charCode: " + e.charCode);
            //console.log("ctrlKey: " + e.ctrlKey);
            return (delta);
        }

        /* else we're in chrome */
        if (e.ctrlKey) {
            if (e.key == '.' || e.key == 'n') {
                delta = -1;
            }
            else if (e.key == ',' || e.key == 'p') {
                delta = 1;
            }
        }
        else if (e.code == "ArrowUp") {
            delta = 1;
        }
        else if (e.code == "ArrowDown") {
            delta = -1;
        }

        return (delta);
    },

    /*
     *  ======== _readAndClear ========
     *  read command, clear input buffer, execute command, update the
     *  history buffer
     */
    _readAndClear: function () {
        /* read and clear command input line */
        var cmd = this.$.shell_input.value;
        this.$.shell_input.value = "";

        /* reset position in history buffer */
        this.historyPos = 0;

        /* evaluate command */
        cmd = this._eval(cmd);

        /* if it's a new command, push it into history buffer */
        if (cmd != "" && cmd != this.history[this.history.length - 1]) {
            this.history.push(cmd);

            /* don't save more than 100 commands in history */
            if (this.history.length > 100) {
                this.history.shift();  /* drop the oldest command */
            }

            /* update saved state for new shells */
            rovUtils.setLocalStorageItem(this.name + "-storage",
                    JSON.stringify({history: this.history}));
        }
    }
});
