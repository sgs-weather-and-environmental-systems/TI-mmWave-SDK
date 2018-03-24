/* JavaScript arrays seems the most efficient choice for keeping Warning 
 * structures. Warning IDs will not be constrained to small number, and there is 
 * no requirement that there are no holes in the sequence of IDs. Also, it is 
 * important to minimize the search time so any type of the unordered list can't
 * be used. XDCscript arrays are not good because they are not sparse, XDCscript 
 * maps are not good because we can't force the maps to use string keys as
 * indices for the underlying Java Vector. For example, the following sequence:
 * Map.add("1", WARN1);
 * Map.add("3", WARN2);
 * causes the first entry to be added as Map[0], and the second entry as Map[1].
 * We would have to add entries in a very constrained way to keep the key and
 * the index the same.
 *
 * The IDs are at the same time indices in the array, but also members of the
 * element structure. This means some information is duplicated, but for now I
 * will leave it as that because I set the ID in the structure to -1 to mark
 * the entry disabled.
 */
var warningsMap = [];

/* This function goes through the properties of the module and automatically 
 * enters Warnings in the array. If there is already an entry and the ID in
 * the element structure is -1, that warning should be skipped over. However, in 
 * the current sequence of function calls there is no need for it because 
 * disable() is called after module$meta$init, and module$meta$init is the only
 * place where new Warnings are added.
 */
function module$meta$init() {
    for (var prop in this) {
        if ("$$proto" in this[prop]
            && this[prop].$$proto == "xdc.Warnings.Warning") {
                warningsMap[this[prop].id] = this[prop];
        }
    }
}

function disable(ids) {
    for (var i = 0; i < ids.length; i++) {
        var id = Number(ids[i]);
        warningsMap[id] = new this.Warning({id: -1, msg: null});
    }
}

/* This function is called from $logWarning to get Warning specified in the
 * $logWarning call and to substitute %s with the actual strings.
 */
function getMessage(wp) {
    var id = wp.warning.id;
    if (warningsMap[id] == undefined) {
        return("_undf");
    }
    if (warningsMap[id].id == -1) {
        return("_dsbl");
    }

    var msg = "ID=" + id + ": " + warningsMap[id].msg;
    if (wp.args != undefined) {
        var i = 0;
        var tmpmsg = msg.replace(/%s/g, function() {
            var ret = (i < wp.args.length) ? wp.args[i] : "";
            i++;
            return(ret);
        });
        msg = tmpmsg;
    }
    return(msg);
}
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:07; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

