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
 *  Callback notification on RTSC config parameters.
 *
 *  Lets user code receive a notification whenever a
 *  config param of a module or instance is read or modified.
 *
 *  @see ./doc-files/xdc/services/getset/package-summary.html JavaDoc
 */
metaonly module GetSet
{
    /*!
     *  ======== onGet ========
     *  Add a getter function to a field.
     *
     *  Each getter acts like an interrupt that is triggered by a read
     *  a field of an object. The field could be a config param of a module
     *  or an instance, or a field of a struct.
     *
     *  @a(example)
     *  The following example prints a message on any read of a
     *  config param named `cfg` in module `pkg.Mod`:
     *  @p(code)
     *    GetSet.onGet(Mod, "cfg", function(sel, val) {
     *        // prints "pkg.Mod.cfg returned <value>"
     *        print(this.$name + "." + sel + " returned " + val);
     *    });
     *  @p
     */
    function onGet(obj, sel, getter);

    /*!
     *  ======== onSet ========
     *  Add a setter function to a field.
     *
     *  Each setter acts like an interrupt that is triggered by modifying
     *  a field of an object. The field could be a config param of a module
     *  or an instance, or a field of a struct.
     *
     *  Setters execute only when the field actually changes value. They do
     *  not execute if the field's current value is written back to it.
     *
     *  Setters may themselves modify fields, and so trigger other setters.
     *  The original execution flow resumes when all fields stop changing
     *  value. In the case of cycles between setters, typically this means
     *  that at least one setter executes twice and makes no further
     *  changes the second time through.
     *
     *  If the setter throws a JavaScript Error or Java exception, then
     *  the field's original value is restored. The exception bubbles back
     *  through the call stack, so that if a setter caused a cascade of
     *  changes, all are restored to their original values.
     *
     *  @a(example)
     *  The following example prints a message on any write to a
     *  config param named `cfg` in module `pkg.Mod`:
     *  @p(code)
     *    GetSet.onSet(Mod, "cfg", function(sel, val, oldVal, exception) {
     *        // prints "pkg.Mod.cfg set to <value>"
     *        print(this.$name + "." + sel + " changed to " + val);
     *        // prints previous value before change
     *        print("  was " + oldVal);
     *    });
     *  @p
     *
     *  @a(example)
     *  The following example makes it an error to change `Mod.cfg`:
     *  @p(code)
     *    GetSet.onSet(Mod, "cfg", function(sel, val, oldVal, exception) {
     *        // don't throw an exception if already recovering from one
     *        if (!exception) {
     *            throw new Error("You'll never change me!");
     *        }
     *    });
     *  @p
     */
    function onSet(obj, sel, setter);

    /*!
     *  ======== createGroup ========
     *  Create a group of related setter functions.
     *
     *  The purpose of a group is to control interactions between setters.
     *  If each setter acts like an interrupt, then a group is like an
     *  interrupt controller that determines when setters are permitted
     *  to run.
     *
     *  Each group is non-reentrant. Once any setter in the group is
     *  running, it runs to completion before any other setter in the
     *  same group may run. This allows the setters to modify internal
     *  state without interference from other setters that operate on
     *  the same internal state.
     *
     *  Each group runs to completion. When a setter in the group runs, it
     *  might modify other config params and cause further setters in the
     *  same group to run. All of these complete before control is returned
     *  to the original execution flow. From the point of view of code
     *  outside the group, all the setters ran as an atomic operation.
     *
     *  Groups may be interrupted. When a setter modifies a config param
     *  that is being monitored by a second group, the second group starts
     *  running immediately. It will run to completion before returning
     *  control to the first group. So the first group sees the second
     *  group as atomic. This allows groups to be tested independently,
     *  and combined without affecting their behavior.
     *
     *  Cycles aren't permitted in the execution flow between groups. If a
     *  setter gets triggered from a group that has already been interrupted,
     *  it is deferred and run when control eventually returns to its own
     *  group. Cycles between groups can break the appearance of atomic
     *  execution, and so should be avoided when possible.
     *
     *  @a(returns)
     *  A Java object of class
     *    {@link ./doc-files/xdc/services/getset/Group.html Group}.
     *  Can then use Group.onSet() to add functions to the group.
     *
     *  @a(example)
     *  The following example code forces the values of the config params
     *  `ModA.a` and `ModB.b` to be equal:
     *  @p(code)
     *    var group = GetSet.createGroup();
     *    group.onSet(ModA, "a", function aToB(){ ModB.b = ModA.a; });
     *    group.onSet(ModB, "b", function bToA(){ ModA.a = ModB.b; });
     *  @p
     */
    function createGroup();

    /*!
     *  ======== init ========
     *  Add support for getters and setters to all fields of an object.
     *
     *  Initializes getter and setter support for every field of
     *  the object. The object can be a module, instance, or structure.
     *
     *  This is a convenience function. The `onSet` and `onGet` functions
     *  already add support to the one field of interest. The `init`
     *  function is useful mostly to make fields visible to global setters
     *  and getters, for example for debugging.
     */
    function init(obj);

    /*!
     *  ======== debug ========
     *  Print execution trace info showing the flow of getters and setters.
     */
    config Bool debug = false;

    /*!
     *  ======== maxIterations ========
     *  Limit the number of iterations allowed for a group to converge, to
     *  help debug. The default value of 0 means no limit.
     */
    config int maxIterations = 0;

    /*!
     *  ======== maxStackDepth ========
     *  Set the maximum allowed depth of recursively nested setters, as
     *  a debugging aid. The default value of 0 means no limit.
     */
    config int maxStackDepth = 0;
}
