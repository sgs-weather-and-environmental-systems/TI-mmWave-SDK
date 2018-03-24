/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/
/*!
 *  ======== xdc.shelf ========
 *  Third party open source tools required by XDCtools
 *
 *  The following jars are part of this package:
 *  @p(html)
     <table border="1">
     <tr>
       <th>Jar</th>
       <th>Version</th>
       <th>License</th>
       <th>From</th>
       <th>Description</th>
     </tr>
     <tr>
       <td>js.jar</td>
       <td>1.7R4</td>
       <td><a href="./doc-files/rhino/LICENSE.txt">MPL 2.0</a> 
           (<a href="./doc-files/rhino/Rhino_License.htm">note</a>)</td>
       <td><a href="http://www.mozilla.org/rhino">
           http://www.mozilla.org/rhino</a></td>
       <td>Java implementation of JavaScript 1.5</td>
     </tr>
     <tr>
       <td>antlr.jar</td>
       <td>3.1.1</td>
       <td><a href="./doc-files/antlr/LICENSE.txt">BSD</a></td>
       <td><a href="http://www.antlr.org">http://www.antlr.org</a></td>
       <td>LR parser generator used to implement the RTSC IDL</td>
     </tr>
     <tr>
       <td>tar.jar</td>
       <td>2.5</td>
       <td>Public Domain</td>
       <td><a href="http://www.trustice.com/java/tar">
           http://www.trustice.com/java/tar</a></td>
       <td>tar file reader</td>
     </tr>
     </table> 

 *  @p
 *  In addition to the jars above, XDCtools requires the following
 *  third-party software:
 *  @p(html)

     <table border="1">
     <tr>
       <th>Name</th>
       <th>Version</th>
       <th>License</th>
       <th>From</th>
       <th>Description</th>
     </tr>
     <tr>
       <td>gmake</td>
       <td>3.81</td>
       <td><a href="./doc-files/gmake/COPYING">GPL v2</a></td>
       <td><a href="http://savannah.gnu.org/projects/make">
           http://savannah.gnu.org/projects/make</a></td>
       <td>command run by the `xdc` command to create and build packages</td>
     </tr>
     <tr>
       <td>J2SE Runtime Environment(JRE)</td>
       <td>1.6.0_37</td>
       <td><a href="http://java.com/license">Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX</a></td>
       <td><a href="http://www.oracle.com/technetwork/java/javase/">
           http://www.oracle.com/technetwork/java/javase/</a></td>
       <td>XDCtools core functionality is implemented in Java. Also required by the Rhino JavaScript engine shipped with XDCtools.</td>
     </tr>
     </table>
 *  @p
 *
 *  Although the following tools are not required, they are optionally shipped
 *  with XDCtools distributions to ensure consistent behavior across various
 *  development platforms.
 *  @p(html)
     <table border="1">
     <tr>
       <th>Exe</th>
       <th>Version</th>
       <th>License</th>
       <th>From</th>
       <th>Description</th>
     </tr>
     <tr>
       <td>zip, unzip</td>
       <td>2.3 and 5.50</td>
       <td><a href="./doc-files/zip/LICENSE.txt">info-zip</a></td>
       <td><a href="http://www.info-zip.org">http://www.info-zip.org</a></td>
       <td>command line utilities to zip and unzip package releases</td>
     </tr>
     <tr>
       <td>tar</td>
       <td>1.21</td>
       <td><a href="./doc-files/tar/COPYING">GPL v3</a></td>
       <td><a href="http://www.gnu.org/software/tar">
           http://www.gnu.org/software/tar</a></td>
       <td>command line utilities to archive package directories</td>
     </tr>
     <tr>
       <td>sh, gunzip, gzip, sed</td>
       <td>cygwin 1.5.25-15</td>
       <td><a href="./doc-files/cygwin/COPYING.txt">GPL v2</a></td>
       <td><a href="http://cygwin.com">http://cygwin.com</a></td>
       <td>(Windows only) korn shell compatible shell used by GNU make</td>
     </tr>
     <tr>
       <td>cat, cp, date, echo, mkdir, mv, pwd, rm, touch</td>
       <td>cygwin 1.5.25-15 (coreutils 6.10)</td>
       <td><a href="./doc-files/coreutils/COPYING.txt">GPL v3</a></td>
       <td><a href="http://cygwin.com">http://cygwin.com</a></td>
       <td>(Windows only) common utilites called from GNU make makefiles</td>
     </tr>
     </table>
 *  @p
 *  All other files that are part of XDCtools are licensed under either
 *  {@link ./doc-files/eclipse/epl-v10.html EPL v1.0} or dual-licensed under
 *  {@link ./doc-files/eclipse/edl-v10.html EDL v1.0}.
 */
package xdc.shelf [1, 0, 0] {
}
