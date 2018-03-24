/*
 *  ======== event.c ========
 *  The event example shows how to use the ti.sysbios.knl.Event module.
 *  The ti.sysbios.knl.Event module solves the "Wait on Multiple" problem.
 *  In this example a reader task waits on several events. It needs to wake
 *  up when events with Ids Event_Id_0 and Event_Id_1 occur or Event_Id_2
 *  occurs. The ti.sysbios.knl.Event module provides an Event_pend() API that 
 *  allows a task to specify an AND mask and an OR mask. These masks determine
 *  which event(s) must occur before returning from Event_pend().
 *   
 *  In this example the event related to Event_Id_0 is posted by a Clock
 *  Instance using a call to Event_post(). This is an example of Explicit
 *  posting of events.
 *  Event_Id_1 is posted from within a Semaphore Instance. This is an example
 *  of Implicit posting of events. This is useful when a task needs to wait on 
 *  a semaphore and an event which is explicitly posted.
 *  Event_id_2 is posted from within a Mailbox Instance. This is also an
 *  example of Implicit posting of events.
 */

#include <xdc/std.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Clock.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Event.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <ti/sysbios/knl/Mailbox.h>

#include <xdc/cfg/global.h>

#define NUMMSGS         3       /* number of messages */
#define TIMEOUT         12      /* timeout value */

typedef struct MsgObj {
    Int         id;             /* writer task id */
    Char        val;            /* message value */
} MsgObj, *Msg;


Clock_Handle clk1, clk2;
Event_Handle evt;
Mailbox_Handle mbx;
Semaphore_Handle sem;
  
Void clk0Fxn(UArg arg0);
Void clk1Fxn(UArg arg0);
Void reader(UArg arg0, UArg arg1);
Void writer(UArg arg0, UArg arg1);

/*
 *  ======== main ========
 */
Int main()
{       
    Clock_Params     clkParams;
    Task_Params      tskParams;
    Mailbox_Params   mbxParams;
    Semaphore_Params semParams;
    
    /* Create a one-shot Clock Instance with timeout = 5 system time units */
    Clock_Params_init(&clkParams);
    clkParams.startFlag = TRUE;
    clk1 = Clock_create(clk0Fxn, 5, &clkParams, NULL);
    
    /* Create an one-shot Clock Instance with timeout = 10 system time units */
    Clock_Params_init(&clkParams);
    clkParams.startFlag = TRUE;
    clk2 = Clock_create(clk1Fxn, 10, &clkParams, NULL);

    /* create an Event Instance */
    evt = Event_create(NULL, NULL);
    
    /* create a Semaphore Instance */
    Semaphore_Params_init(&semParams);
    semParams.mode = Semaphore_Mode_BINARY;
    semParams.event = evt;
    semParams.eventId = Event_Id_01;
    sem = Semaphore_create(0, &semParams, NULL);

    /* create a Mailbox Instance */
    Mailbox_Params_init(&mbxParams);
    mbxParams.readerEvent = evt;
    mbxParams.readerEventId = Event_Id_02;
    mbx = Mailbox_create(sizeof(MsgObj), 2, &mbxParams, NULL);

    /* create a writer task */
    Task_Params_init(&tskParams);
    tskParams.priority = 1;
    tskParams.arg0 = (UArg) mbx;
    Task_create(writer, &tskParams, NULL);

    /* create a reader task */
    Task_create(reader, &tskParams, NULL);

    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== clk0Fxn =======
 */
Void clk0Fxn(UArg arg0)
{
    /* Explicit posting of Event_Id_00 by calling Event_post() */
    Event_post(evt, Event_Id_00);
}

/*
 *  ======== clk1Fxn =======
 */
Void clk1Fxn(UArg arg0)
{
    /* Implicit posting of Event_Id_01 by Sempahore_post() */
    Semaphore_post(sem);
}       

/*
 *  ======== reader ========
 */
Void reader(UArg arg0, UArg arg1)
{
    MsgObj msg;
    UInt posted;

    for (;;) {
        /* wait for (Event_Id_00 & Event_Id_01) | Event_Id_02 */
        posted = Event_pend(evt, 
            Event_Id_00 + Event_Id_01,  /* andMask */
            Event_Id_02,                /* orMask */
            TIMEOUT);

        if (posted == 0) { 
            System_printf("Timeout expired for Event_pend()\n");
            break;
        }
       
        if ((posted & Event_Id_00) && (posted & Event_Id_01)) {
            if (Semaphore_pend(sem, BIOS_NO_WAIT)) {
                System_printf("Explicit posting of Event_Id_00 and Implicit posting of Event_Id_01\n");
            }
            else {
                System_printf("Semaphore not available. Test failed!\n");
            }
            break;
        }
        else if (posted & Event_Id_02) {
            System_printf("Implicit posting of Event_Id_02\n");
            if (Mailbox_pend(mbx, &msg, BIOS_NO_WAIT)) {
                /* print value */
                System_printf("read id = %d and val = '%c'.\n",msg.id, msg.val);
            }
            else {
                System_printf("Mailbox not available. Test failed!\n");
            }
        }
        else {
            System_printf("Unknown Event\n");
            break;
        }
    }
    BIOS_exit(0);
}

/*
 *  ======== writer ========
 */
Void writer(UArg arg0, UArg arg1)
{
    MsgObj      msg;
    Int i;

    for (i=0; i < NUMMSGS; i++) {
        /* fill in value */
        msg.id = i;
        msg.val = i + 'a';

        System_printf("writing message id = %d val = '%c' ...\n", 
        msg.id, msg.val);

        /* enqueue message */
        Mailbox_post(mbx, &msg, TIMEOUT);
    }

    System_printf("writer done.\n");
}

