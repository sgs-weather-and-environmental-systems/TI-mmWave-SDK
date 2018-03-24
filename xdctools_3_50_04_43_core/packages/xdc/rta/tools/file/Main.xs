/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    print("xdc.rta.tools.file started.");
    
    /* Make sure they at least passed -p or -o */
    if ((!this.printToScreen) && this.outputFile.equals("")) {
        print("\nPass -p to print to the screen or specify an output file " +
              "with -o, or both.");
        return;
    }
    
    /* Verify the arguments. */
    if (!fileExists(this.executable)) {
        print("Executable " + this.executable + " does not exist.");
        return;
    }
    if (!this.rtaXml.equals("") && !fileExists(this.rtaXml)) {
        print("RTA XML file " + this.rtaXml + " does not exist.");
        return;
    }
    if (!fileExists(this.dataFile)) {
        print("Data file " + this.dataFile + " does not exist.");
        return;
    }

    /* Load the classes in the RTA package for decoding the records. */
    xdc.loadPackage('xdc.rta');
    
    /* Load the .out file parser packages. */
    xdc.loadPackage('ti.targets.omf.cof');
    xdc.loadPackage('ti.targets.omf.elf');
    
    /* Create the MetaData object. */
    var meta = new Packages.xdc.rta.MetaData();
    
    /* Initialize the MetaData. */
    if (!this.rtaXml.equals("")) {
        meta.parse(this.rtaXml, this.executable);
    }
    else {
        meta.parseFromExec(this.executable);
    }
    
    /* Create the decoder object. */
    var dec = new Packages.xdc.rta.Decoder(meta);
    
    /* Open an input stream to read the data file. */
    var f = new xdc.jre.java.io.File(this.dataFile);
    var fis = new xdc.jre.java.io.FileInputStream(f);

    /* Create a buffer for reading bytes into. */
    var buffer = 
        xdc.jre.java.lang.reflect.Array.newInstance(
            xdc.jre.java.lang.Byte.TYPE, 4096);

    /* Get the target record size. */
    var recSize = meta.getTargetEventRecSize();
    
    var writeToFile = !this.outputFile.equals("");
    
    if (this.more) {
        print("-m : The script will wait for you to press 'enter' before " +
              "displaying the next buffer...");
        cmdr.read();
    }
    
    /* Create the file writer for the output file. */
    var fw;
    var d = this.delimiter;
    if (writeToFile) {
        var f = xdc.jre.java.io.File(this.outputFile);
        fw = xdc.jre.java.io.FileWriter(f);
        fw.write("Timestamp" + d + "Sequence Num" + d + "Module" + d +
                 "Message" + d + "Logger\n");
    }
    
    /* Read from the file until we reach the end. */
    while (fis.available() != 0) {
        /* First read the packet header. */
        fis.read(buffer, 0, 8);
        
        /* Decode the packet header. */
        var loggerId = dec.decodeBytes(buffer, 0, 4, true);
        var numBytes = dec.decodeBytes(buffer, 4, 4, true);
        
        /* Print the header */
        if (this.printToScreen && !this.suppressHeader) {
            print("\n=============================================");
            print(meta.getLoggerNames()[loggerId] + " - " + 
                  (numBytes / recSize) + " records");
            print("=============================================\n");
        }
        
        /* Read body of packet data */
        fis.read(buffer, 0, numBytes);        
    
        /* Decode each of the records. */
        for (var i = 0; i < (numBytes / recSize); i++) {
            /* Decode the record. */
            var evt = dec.apply(buffer, i * recSize);
            
            /* Write the decoded record. */
            if (writeToFile) {
                fw.write(evt.timestamp + d + evt.sequenceNum + d + 
                         evt.getModuleName() + d + evt.getEventMsg() + d + 
                         meta.getLoggerNames()[loggerId] + "\n");
            }
            
            /* Print the decoded record. */
            if (this.printToScreen) {
                print("[" + evt.timestamp + "] #" + evt.sequenceNum + ": " +
                      getShortModName(evt) + " " + evt.getEventMsg());
            }            
        }
        
        /* Wait for the user to press enter before moving to the next packet.*/
        if (this.more) {
            cmdr.read();
        }
    }
    
    /* Close the input stream. */
    fis.close();
    
    /* Close the file writer. */
    if (writeToFile) {
        fw.close();
    }
    
    print("xdc.rta.tools.file done.");
}
 
/*
 *  ======== fileExists ========
 *  Returns whether or not the file at the given path exists.
 */
function fileExists(filePath) {
    return (xdc.jre.java.io.File(filePath).exists());
}

/*
 *  ======== getShortModName ========
 *  Takes an event, retrieves its module name, then strips off the package
 *  name leaving just the module name.
 */
function getShortModName(evt)
{
    var name = evt.getModuleName();
    
    return (name.substring(name.lastIndexOf('.') + 1, name.length()));
}