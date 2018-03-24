Polymer({ is : "ti-rov-data",
    properties: {
        pendingRequests : {
          type: Array,
          value: []
        },
        requestTimeout : {
          type : Number,
          value: 10000
        },
        inTimeout : {
          type: Boolean,
          value: false
        },
        connectTimeout : {
          type : Number,
          value: 20000
        }
    },
    cancelAllPendingRequests : function () {
        for (var i = 0; i < this.pendingRequests.length; i++) {
            var pendingReqObj = this.pendingRequests[i];
            var handle = Number(pendingReqObj.timeoutHandle);
            pendingReqObj.timeoutHandle = null;
            this.cancelAsync(handle);
            pendingReqObj.reqMod.getViewCallback('cancelled',
                null, pendingReqObj.reqMod.moduleName, pendingReqObj.reqMod.viewName, handle);
        }
        this.pendingRequests = [];
    },
    debuggerEvent : function(detail, reqObj) {
        reqObj.reqMod.debuggerEvent(detail);
    },
    discoverAddOns : function (reqMod) {
        var reqObj = {reqMod: reqMod, rovData : this};
        reqObj.timeoutHandle = String(this.async(function() {return (this.discoverAddOnsTimeoutCallback(reqObj));}, this.requestTimeout));
        return(discoverAddons(reqObj, this.discoverAddOnsCallback));
    },
    discoverAddOnsCallback :  function (res, addOns, reqObj) {
        if (reqObj.timeoutHandle != null) {
            var handle = Number(reqObj.timeoutHandle);
            reqObj.timeoutHandle = null;
            reqObj.rovData.cancelAsync(handle);
            reqObj.reqMod.discoverAddOnsCallback(res, addOns);
        }
    },
    discoverAddOnsTimeoutCallback : function(reqObj) {
        reqObj.timeoutHandle = null;
        reqObj.reqMod.discoverAddOnsCallback('Timeout discovering ROV add ons', null);
    },
    getView: function(module, view, reqMod) {
        if (this.hasPendingRequest(module, view, reqMod)){
            return (null);
        }
        var reqObj = {reqMod: reqMod, rovData : this, timeoutHandle : null, module: module, view: view};
        reqObj.timeoutHandle = String(this.async(function() {return (this.getViewTimeoutCallback(reqObj));}, this.requestTimeout));
        this.pendingRequests.push(reqObj);
        var handle = reqObj.timeoutHandle;
        getView(module, view, reqObj, this.getViewCallback);
        return (handle);
    },
    getViewCallback: function(error, res, module, view, reqObj) {
        if (!reqObj.rovData.inTimeout && reqObj.rovData.pendingRequests.length > 0 &&
            reqObj.timeoutHandle != null) {
            var handle = Number(reqObj.timeoutHandle);
            reqObj.timeoutHandle = null;
            reqObj.rovData.cancelAsync(handle);
            /* Remove from request list */
            for (var i = 0; i <  reqObj.rovData.pendingRequests.length; i++) {
                if (reqObj.rovData.pendingRequests[i] == reqObj) {
                    reqObj.rovData.pendingRequests.splice(i, 1);
                    break;
                }
            }
            reqObj.reqMod.getViewCallback(error, res, module, view, handle);
        }
    },
    getViewList : function(reqMod) {
        return(getViewList(reqMod, this.getViewListCallback));
    },
    getViewListCallback: function(error, viewList, reqMod) {
        reqMod.getViewListCallback(error, viewList);
    },
    getViewTimeoutCallback : function(reqObj) {
        if (this.inTimeout || this.pendingRequests.length == 0) {
            return;
        }
        this.inTimeout = true;
        var name = reqObj.reqMod.moduleName ? (reqObj.reqMod.moduleName + '  ' + reqObj.reqMod.viewName) : reqObj.reqMod.viewName;
        if (!confirm('\n    The update request for\n\n' + '    ' + name +
            '\n\n    has timed out.  To continue waiting, click OK.\n    Click Cancel to stop waiting for this update.\n\n')) {
            /* User has killed request(s). Cancel all pending request timeouts
               and send timeout error to all views with pending requests */
            var handle = reqObj.timeoutHandle;
            reqObj.timeoutHandle = null;
            reqObj.reqMod.getViewCallback('Data request timeout', null, reqObj.reqMod.moduleName, reqObj.reqMod.viewName, handle);
            for (var i = 0; i < this.pendingRequests.length; i++) {
                if (this.pendingRequests[i] != reqObj) {
                    var pendingReqObj = this.pendingRequests[i];
                    handle = Number(pendingReqObj.timeoutHandle);
                    pendingReqObj.timeoutHandle = null;
                    this.cancelAsync(handle);
                    pendingReqObj.reqMod.getViewCallback('Data request timeout',
                            null, pendingReqObj.reqMod.moduleName, pendingReqObj.reqMod.viewName, handle);
                }
            }
            this.pendingRequests = [];
        }
        else {
            /* Reset timeout for this and all remaining pending requests */
            reqObj.timeoutHandle = String(this.async(function() {return (this.getViewTimeoutCallback(reqObj));}, this.requestTimeout));
            for (var i = 0; i < this.pendingRequests.length; i++) {
                if (this.pendingRequests[i] != reqObj) {
                    var pendingReqObj = this.pendingRequests[i];
                    var handle = Number(pendingReqObj.timeoutHandle);
                    pendingReqObj.timeoutHandle = null;
                    this.cancelAsync(handle);
                    pendingReqObj.timeoutHandle = String(this.async(function() {return (this.getViewTimeoutCallback(pendingReqObj));}, this.requestTimeout));
                }
            }
        }
        this.inTimeout = false;
    },
    hasPendingRequest : function (module, view, reqMod) {
        for (var i = 0; i < this.pendingRequests.length; i++) {
            var pendingReqObj = this.pendingRequests[i];
            if (pendingReqObj.module == module && pendingReqObj.view == view &&
                pendingReqObj.reqMod.id == reqMod.id) {
                return (true);
            }
        }
        return (false);
    },
    setConnectTimeout : function (timeout) {
        this.connectTimeout = timeout;
    },
    setExecutable : function(execPath, reqMod) {
        var reqObj = {reqMod: reqMod, rovData : this};
        reqObj.timeoutHandle = String(this.async(function() {return (this.setExecutableTimeoutCallback(reqObj));}, this.connectTimeout));
        return(setExecutable(execPath, reqObj, this.setExecutableCallback, this.setExecutableProgressCallback,
                             this.debuggerEvent));
    },
    setExecutableCallback : function(res, reqObj) {
        if (reqObj.timeoutHandle != null) {
            var handle = Number(reqObj.timeoutHandle);
            reqObj.timeoutHandle = null;
            reqObj.rovData.cancelAsync(handle);
            reqObj.reqMod.setExecutableCallback(res);
        }
    },
    setExecutableProgressCallback : function(res, reqObj) {
        if (reqObj.timeoutHandle != null) {
            reqObj.reqMod.setExecutableProgressCallback(res);
        }
    },
    setExecutableTimeoutCallback : function(reqObj) {
        if (!confirm('Target is not responding and may need to be reset.\nContinue to wait?')) {
            reqObj.timeoutHandle = null;
            reqObj.reqMod.setExecutableCallback({resStr: 'Connect timeout'}, null, reqObj.reqMod.moduleName, reqObj.reqMod.viewName);
        }
        else {
            /* Reset timeout for this and keep waiting */
            reqObj.timeoutHandle = String(this.async(function() {return (this.setExecutableTimeoutCallback(reqObj));}, this.connectTimeout));
        }
    },
    setRequestTimeout : function (timeout) {
        this.requestTimeout = timeout;
    }
});
