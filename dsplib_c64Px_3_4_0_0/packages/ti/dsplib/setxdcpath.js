if (environment['xdc.hostOS'] == undefined) {
  environment["xdc.hostOS"] = java.lang.System.getProperty("os.name") + "";
  if (environment["xdc.hostOS"].match(/^Windows/i)) {
    environment["xdc.hostOS"] = "Windows";
  }
}

var fileModule = xdc.module('xdc.services.io.File');
var fileName   = "tempcfg.bat";
var Mode       = "w";
var openedFile = fileModule.open(fileName, Mode);

if (openedFile == undefined) {
  print ("Unable to create "+ fileName+", Please check your write Permission");
  java.lang.System.exit(2);
}

/* Config.bld Path */
var path = xdc.findFile("ti/mas/swtools");
if (path) {
  /* print path */
  path=path.toString().replace(/\\/g, "/");
  var command="set XDCBUILDCFG="+ fileModule.getDOSPath(path)+"/config.bld";
  openedFile.writeLine(command+"\n");
  openedFile.writeLine("");
  command="set SWTOOLS_DIR="+ fileModule.getDOSPath(path);
  openedFile.writeLine(command+"\n");
  openedFile.writeLine("");
}
else {
  print(" Error: config.bld not found in swtools directory");
  java.lang.System.exit(1);
}

/* Root of TI folder */
var path    = xdc.findFile(".\\..");
var abspath = path.split("\\ti");

if (path) {
  var command = "set INCDIR="+fileModule.getDOSPath(abspath[0].toString().replace(/\\/g,"/"));
  openedFile.writeLine (command + "\n");
  openedFile.writeLine ("");
  var command = "set XDCPATH=%XDCPATH%;"+fileModule.getDOSPath(abspath[0].toString().replace(/\\/g,"/"));
  openedFile.writeLine (command + "\n");
  openedFile.writeLine ("");
  var command = "set DSPLIB_INSTALL_DIR="+fileModule.getDOSPath(abspath[0].toString().replace(/\\/g,"/"));
  openedFile.writeLine (command + "\n");
  openedFile.writeLine ("");
}

/* Set GIT path */
var pathFile = fileModule.open("path.txt", "r");
var paths=pathFile.readLine();
paths=paths.toString().split(";");
var gitPath="";
for each (var path in paths)
{
  if(path.toString().toLowerCase().match("git"))
  {
    path=path.toString().replace(/\r/g,"");
	path=path.toString().replace(/\n/g,"");
    gitPath=path;
    break;
   }

}
if (gitPath) {
  /* print path */

  var command="set PATH=%PATH%;"+ gitPath+"\;";
  openedFile.writeLine(command+"\n");
  openedFile.writeLine("");
}


pathFile.close();
openedFile.close()
