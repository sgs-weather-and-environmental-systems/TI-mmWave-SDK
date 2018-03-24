var rovLocalStorage = window.localStorageExt || window.localStorage;
window._rovResizeObj = null;
window._rovViewDragObj = null;

var rovUtils = {
    leftPaneWidth : 184,

    destroyClickedElement : function(event) {
	    document.body.removeChild(event.target);
    },

    downloadText : function(textToWrite, fileNameToSaveAs) {
        /* create a link that can be clicked to download the saved data */
        var downloadLink = document.createElement("a");
        downloadLink.download = fileNameToSaveAs;
        downloadLink.innerHTML = "Download File";

        var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
        if (window.webkitURL != null) {
            /* Chrome allows clicking links that are not in the DOM */
            downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
        }
        else {
            /* Firefox requires clickable links to be in the DOM */
            downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
            downloadLink.onclick = this.destroyClickedElement;
            downloadLink.style.display = "none";
            document.body.appendChild(downloadLink);
        }
        downloadLink.click();
    },
    enableDragPointerEvents : function (panel, elem, enable) {
        panel.$.rovHeaderPanel.style.pointerEvents = enable;
        elem.style.pointerEvents = enable;
    },
    initRovViewDrag : function (e, elem, panel) {
        var rect = elem.getBoundingClientRect();
        _rovViewDragObj = {};
        _rovViewDragObj.xOffset = e.clientX - rect.left;
        _rovViewDragObj.yOffset = e.clientY - rect.top;
        _rovViewDragObj.elem = elem;
        _rovViewDragObj.rovUtils = this;
        _rovViewDragObj.panel = panel;
        _rovViewDragObj.dragged = false;
        _rovViewDragObj.lBound = panel.isNarrow() ? 0 : this.leftPaneWidth;
        _rovViewDragObj.rBound = panel.isNarrow() ? _rovViewDragObj.panel.viewContainer.clientWidth : _rovViewDragObj.panel.viewContainer.clientWidth + this.leftPaneWidth;
        _rovViewDragObj.bBound = _rovViewDragObj.panel.viewContainer.clientHeight;
        panel.style.cursor = '-webkit-grabbing';
        this.enableDragPointerEvents(panel, elem, 'none');
        window.addEventListener('mousemove', this.rovViewDrag, false);
        window.addEventListener('mouseup', this.stopRovViewDrag, false);
    },

    rovViewDrag : function (e) {
        if (_rovViewDragObj) {
            if (e.clientX >= _rovViewDragObj.rBound) {
                var xPos = (_rovViewDragObj.rBound - _rovViewDragObj.xOffset) - _rovViewDragObj.lBound;
            }
            else {
                var xPos = (e.clientX - _rovViewDragObj.xOffset) < _rovViewDragObj.lBound ?
                           0 : (e.clientX - _rovViewDragObj.xOffset) - _rovViewDragObj.lBound;
            }
            if (e.clientY >= _rovViewDragObj.bBound) {
                var yPos = (_rovViewDragObj.bBound - _rovViewDragObj.yOffset);
                if (_rovViewDragObj.panel.viewContainer.scrollWidth > _rovViewDragObj.panel.viewContainer.clientWidth) {
                    yPos -= 16;  /* scroll bar will hide top of view w/o this */
                }
            }
            else {                                            /* paper-card margin-top is 8 */
                var yPos = (e.clientY - _rovViewDragObj.yOffset) < 40 ? -8 : (e.clientY - _rovViewDragObj.yOffset) - 48;
            }
            _rovViewDragObj.left = xPos + _rovViewDragObj.panel.viewContainer.scrollLeft;
            _rovViewDragObj.top = yPos + _rovViewDragObj.panel.viewContainer.scrollTop;
            _rovViewDragObj.elem.style.left = _rovViewDragObj.left + 'px';
            _rovViewDragObj.elem.style.top = _rovViewDragObj.top + 'px';
            _rovViewDragObj.dragged = true;
        }
    },

    stopRovViewDrag : function (e) {
        if (_rovViewDragObj) {
             if (_rovViewDragObj.dragged) {
                 _rovViewDragObj.panel.viewDropDisplay.call(_rovViewDragObj.panel, e, _rovViewDragObj.elem.id, 0, 8);
             }
            _rovViewDragObj.panel.style.cursor = 'inherit';
            _rovViewDragObj.rovUtils.enableDragPointerEvents(_rovViewDragObj.panel, _rovViewDragObj.elem, '');
            window.removeEventListener('mousemove', _rovViewDragObj.rovUtils.rovViewDrag, false);
            window.removeEventListener('mouseup', _rovViewDragObj.rovUtils.stopRovViewDrag, false);
            _rovViewDragObj = null;
        }
    },

    getLocalStorageItem : function (key) {
        return (rovLocalStorage.getItem(key));
    },

    getLocalStorageObject : function (key) {
        var item = rovLocalStorage.getItem(key);
        return (item ? JSON.parse(item) : {});
    },

    rovLocalStorageLength : function () {
        return (rovLocalStorage.length);
    },

    removeLocalStorageItem : function (key) {
        if (window.localStorageExt) {
            rovLocalStorage.removeIem(key);
            return;
        }
        rovLocalStorage.removeItem(key);
    },

    setLocalStorageItem : function (key, value) {
        if (value === null || value === undefined) {
            if (window.localStorageExt) {
                rovLocalStorage.removeIem(key);
                return;
            }
            rovLocalStorage.removeItem(key);
        }
        else {
            rovLocalStorage.setItem(key, value);
        }
    },

    setLocalStorageObject : function (key, value) {
        if (value === null || value === undefined) {
            if (window.localStorageExt) {
                rovLocalStorage.removeIem(key);
                return;
            }
            rovLocalStorage.removeItem(key);
        }
        else {
            rovLocalStorage.setItem(key, JSON.stringify(value));
        }
    },

    rovResize : function (e) {
        if (_rovResizeObj) {
            if (_rovResizeObj.viewContentDiv) {
                _rovResizeObj.viewContentDiv.style.position = 'absolute';
                _rovResizeObj.viewContentDiv = null;
            }
            var rect = _rovResizeObj.elem.getBoundingClientRect();
            _rovResizeObj.width = e.clientX - rect.left + 10;
            _rovResizeObj.height = e.clientY - rect.top + 10;
            _rovResizeObj.elem.style.width = _rovResizeObj.width + 'px';
            _rovResizeObj.elem.style.height = _rovResizeObj.height + 'px';
        }
    },

    stopRovResize : function (e) {
        if (_rovResizeObj) {
            if (_rovResizeObj.notifyObj) {
                _rovResizeObj.notifyObj.fxn.call(_rovResizeObj.notifyObj.elem);
            }
            _rovResizeObj.elem.style.cursor = 'inherit';
            window.removeEventListener('mousemove', _rovResizeObj.rovUtils.rovResize, false);
            window.removeEventListener('mouseup', _rovResizeObj.rovUtils.stopRovResize, false);
            _rovResizeObj = null;
        }
    },

    initRovResize : function (e, elem, notifyObj, viewContentDiv) {
        var rect = elem.getBoundingClientRect();
        _rovResizeObj = {};
        _rovResizeObj.elem = elem;
        _rovResizeObj.rovUtils = this;
        _rovResizeObj.viewContentDiv = viewContentDiv;
        if (notifyObj) {
            _rovResizeObj.notifyObj = notifyObj;
        }
        elem.style.cursor = 'se-resize';
        window.addEventListener('mousemove', this.rovResize, false);
        window.addEventListener('mouseup', this.stopRovResize, false);
    },

    isObjectVal : function (val) {
        return (typeof(val)  == 'object' && !val.length);
    },

    getObjectVal : function (val) {
        var keys = Object.keys(val);
        return (val[keys[0]]);
    },

    isObject : function (obj) {
       return (obj && (typeof(obj)  === "object"));
    },

    isArray : function (obj) {
      return (this.isObject(obj) && (obj instanceof Array));
    },

    deepCopy : function (srcObj) {
        return(JSON.parse(JSON.stringify(srcObj)));
    },

    shallowCopy : function (srcObj) {
        var newObj = null;
        if (this.isArray(srcObj)) {
            newObj = [];
            for (var i = 0; i < srcObj.length; i++) {
                newObj.push(srcObj[i]);
            }
        }
        else if (this.isObject(srcObj)) {
            newObj = {};
            var keys = Object.keys(srcObj);
            for (var i = 0; i < keys.length; i++) {
                newObj[keys[i]] = srcObj[keys[i]];
            }
        }
        return (newObj);
    },

    getPackagesInfo : function (modules) {
        var pkgNames = [];
        var pkgs = [];

        for (var i = 0; i < modules.length; i++) {
            var pkgName = modules[i].substr(0, modules[i].lastIndexOf('.'));
            if (pkgNames.indexOf(pkgName) == -1) {
                pkgNames.push(pkgName);
            }
        }
        for (i = 0; i < pkgNames.length; i++) {
            var pkg = {};
            pkg.name = pkgNames[i];
            pkg.units = this.getPkgUnits(pkgNames[i], modules);
            pkgs[pkgNames[i]] = pkg;
        }
        return ({pkgNames : pkgNames, pkgs : pkgs});
    },

    getPkgUnits : function (pkgName, modules) {
        var units = [];
        for (var i = 0; i < modules.length; i++) {
            var name = modules[i].substr(0, modules[i].lastIndexOf('.'));
            if (name == pkgName) {
                var unit = {};
                unit.name = modules[i].substr(modules[i].lastIndexOf('.') + 1);
                units.push(unit);
            }
        }
        return (units);
    },

    objNameCompare : function (obj1, obj2) {
        var name1 = obj1.name.toUpperCase();
        var name2 = obj2.name.toUpperCase();
        if (name1 < name2) {
            return (-1);
        }
        if (name1 > name2) {
            return (1);
        }
        else {
            /* if equal, put upper case first */
            var ch1 = obj1.name.substr(0, 1);
            var ch2 = obj2.name.substr(0, 1);
            if (ch1.toUpperCase() == ch2) {
                return (1);
            }
            if (ch2.toUpperCase() == ch1) {
                return (-1);
            }
        }
        return (0);
    },

    objQualCompare : function (obj1, obj2) {
        var qual1 = obj1.qual.toUpperCase();
        var qual2 = obj2.qual.toUpperCase();
        if (qual1 < qual2) {
            return (-1);
        }
        if (qual1 > qual2) {
            return (1);
        }
        else {
            /* if equal, put upper case first */
            var ch1 = obj1.qual.substr(0, 1);
            var ch2 = obj2.qual.substr(0, 1);
            if (ch1.toUpperCase() == ch2) {
                return (1);
            }
            if (ch2.toUpperCase() == ch1) {
                return (-1);
            }
        }
        return (0);
    },

    strArrCompare : function (arr1, arr2) {
        if (arr1.length != arr2.length) {
            return (false);
        }
        for (var i = 0; i < arr1.length; i++) {
            if (arr1[i] != arr2[i]) {
                return (false);
            }
        }
        return (true);
    },

    getFormat : function (val) {
        if (!val || typeof(val) != 'string' || isNaN(val)) {
            return (null);
        }
        if (val.match(/^0x/i)) {
            return ('Hex');
        }
        if (val.indexOf('E') > 0 || val.indexOf('e') > 0) {
            return ('Scientific');
        }
        return ('Decimal');
    },

    getStringWidth : function (str, font) {
         var canvas = document.createElement("canvas");
         var context = canvas.getContext("2d");
         context.font = font ? font : '14pt arial';
         var metrics = context.measureText(str);
         return (metrics.width);

    },

    validDragElement : function (targetElem) {
        return (typeof(targetElem.className) == 'string' &&
                targetElem.className.indexOf('rovTh') == -1);
    },

    isAnROVNumber : function (val) {
        if ((val && typeof(val) == 'string' && !isNaN(val)) || typeof(val) == 'number') {
            return (true);
        }
        return (false);
    },

    getViewTabs : function (viewList, moduleName) {
        return (this.isArray(viewList[moduleName]) ?
                viewList[moduleName] : viewList[moduleName].viewTabs);
    }

}