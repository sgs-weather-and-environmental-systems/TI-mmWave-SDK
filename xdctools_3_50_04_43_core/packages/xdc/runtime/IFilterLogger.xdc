/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*!
 *  ======== IFilterLogger ========
 *  Interface for supporting filtering of Log events by detail level.
 *
 *  Filtering of events based on detail level is not inherently supported
 *  by the Log APIs as is filtering of events based on the diagnostics mask.
 *  
 *  Support for this type of filtering must be done by an `ILogger` 
 *  implementation. Not all users are interested in this filtering support,
 *  however, so it is not required of all `ILogger` implementations.
 *
 *  `ILoggers` that do intend to support filtering by detail level should 
 *  implement this interface, which extends the `ILogger` interface.
 *
 *  The `{@link #setFilterLevel}` and `{@link #getFilterLevel}` functions
 *  support runtime specification of a different filtering level for each of
 *  the diagnostics categories.
 */
interface IFilterLogger inherits ILogger {

    /*!
     *  ======== filterByLevel ========
     *  Support filtering of events by event level
     *
     *  To improve logging performance, this feature can be disabled by setting
     *  `filterByLevel` to false.
     *
     *  See '{@link #setFilterLevel}' for an explanation of level filtering.
     */
    config Bool filterByLevel = false;

instance:

    /*!
     *  ======== setFilterLevel ========
     *  Set the level of detail that instances will log
     *
     *  Events with the specified level or higher will be logged, events
     *  below the specified level will be dropped.
     *
     *  Events are filtered first by diags category, then by level. If an 
     *  event's diags category is disabled in the module's diags mask, then it 
     *  will be filtered out regardless of level. The event will not even be
     *  passed to the logger.
     *
     *  This API allows for setting the filtering level for more than one
     *  diags category at a time. The mask parameter can be a single category 
     *  or multiple categories combined, and the level will be set for all of
     *  those categories.   
     *
     *  @param(mask) The diags categories to set the level for
     *  @param(filterLevel) The new filtering level for the specified 
     *                      categories
     */
    Void setFilterLevel(Diags.Mask mask, Diags.EventLevel filterLevel);
    
    /*!
     *  ======== getFilterLevel ========
     *  Returns the mask of diags categories currently set to the specified 
     *  level.
     *
     *  See '{@link #setFilterLevel}' for an explanation of level filtering.
     */
    Diags.Mask getFilterLevel(Diags.EventLevel level);

}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

