/*
 *  ======== close ========
 */
function close()
{
    if (xdc.om.$name != 'cfg') {
        return;
    }

    /* declare that Mon has both checksum and write capabilities */
    Program.symbol["xdc_rov_runtime_Mon__checksum"] = 1;
    Program.symbol["xdc_rov_runtime_Mon__write"] = 1;
}
