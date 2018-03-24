/*
 *  ======== memory.c ========
 *  This example shows the use of xdc.runtime.Memory module and different
 *  xdc.runtime.IHeap implementations to manage memory.
 *  A system heap is created statically using ti.sysbios.heaps.HeapMem.
 *  This heap is plugged into xdc.runtime.memory as the defaultHeapInstance.
 *   
 *  This testcase uses two tasks. One task is statically created and one 
 *  is dynamically created. Both tasks use xdc.runtime.Memory to allocate
 *  memory but use different heaps created using different IHeap
 *  implementations. 
 *  Task0 uses ti.sysbios.heaps.HeapBuf to statically 
 *  create its heap (task0Heap) because the allocations in task0 are of 
 *  a fixed size. 
 *  Task1 uses ti.sysbios.heaps.HeapMem to statically create its heap 
 *  (task1Heap) because task1 allocates variable block sizes.
 *  Both tasks print their heap status before and after allocations.
 */
 
#include <xdc/std.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Memory.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/heaps/HeapBuf.h>
#include <ti/sysbios/heaps/HeapMem.h>

#include <xdc/cfg/global.h>

#define TASK0BUFSIZE    32       /* size of allocations */
#define TASK0NUMBUFS    2        /* number of buffers */

#define TASK1BUFSIZE0   128      /* size of allocation */
#define TASK1BUFSIZE1   64       /* size of allocation */
#define TASK1BUFSIZE2   32       /* size of allocation */
#define TASK1BUFSIZE3   16       /* size of allocation */
#define TASK1NUMBUFS    4        /* number of buffers */

Void task0Fxn(UArg arg0, UArg arg1);
Void task1Fxn(UArg arg0, UArg arg1);
Void idl0Fxn();
/* Function to print heap statistics */
static Void printHeapStats(IHeap_Handle heap);

/*
 *  ======== main ========
 */
Int main()
{
    Task_create(task1Fxn, NULL, NULL);
    
    System_printf("Memory example started.\n");

    BIOS_start();    /* does not return */
    return(0);
}

/*
 *  ======== task0Fxn ========
 */
Void task0Fxn(UArg arg0, UArg arg1)
{
    Int i;
    Ptr bufs[TASK0NUMBUFS];

    IHeap_Handle heap = HeapBuf_Handle_upCast(task0Heap);

    System_printf("Initial task0 heap status\n");

    /* print initial task0heap status */
    printHeapStats(heap);

    /* allocate blocks from task0Heap */
    for (i = 0; i < TASK0NUMBUFS; i++) {
        bufs[i] = Memory_alloc(heap, TASK0BUFSIZE, 0, NULL);
    }

    /* free memory blocks */
    for (i = 0; i < TASK0NUMBUFS; i++) {
        Memory_free(heap, bufs[i], TASK0BUFSIZE);
    }

    System_printf("Final task0 heap status\n");

    /* print task0Heap status */
    printHeapStats(heap);

    System_printf("Task0 Complete\n");
}

/*
 *  ======== task1Fxn ========
 */
Void task1Fxn(UArg arg0, UArg arg1)
{
    Ptr bufs[TASK1NUMBUFS];
    IHeap_Handle heap = HeapMem_Handle_upCast(task1Heap);

    System_printf("Initial task1 heap status\n");

    /* print initial task1Heap status */
    printHeapStats(heap);

    bufs[0] = Memory_alloc(heap, TASK1BUFSIZE0, 0, NULL);
    
    bufs[1] = Memory_alloc(heap, TASK1BUFSIZE1, 0, NULL);
    
    bufs[2] = Memory_alloc(heap, TASK1BUFSIZE2, 0, NULL);
   
    Memory_free(heap, bufs[1], TASK1BUFSIZE1);
    Memory_free(heap, bufs[2], TASK1BUFSIZE2);

    bufs[3] = Memory_alloc(heap, TASK1BUFSIZE3, 0, NULL);
    
    Memory_free(heap, bufs[0], TASK1BUFSIZE0);
    Memory_free(heap, bufs[3], TASK1BUFSIZE3);    

    System_printf("Final task1 heap status\n");

    /* print task1Heap status */
    printHeapStats(heap);

    System_printf("Task1 Complete\n");
}

static Void printHeapStats(IHeap_Handle heap)
{
    Memory_Stats stats;

    Memory_getStats(heap, &stats);
#ifdef xdc_target__isaCompatible_28
    System_printf("largestFreeSize = %ld\n", (ULong)stats.largestFreeSize);
    System_printf("totalFreeSize = %ld\n", (ULong)stats.totalFreeSize);
    System_printf("totalSize = %ld\n", (ULong)stats.totalSize);
#else    
    System_printf("largestFreeSize = %d\n", stats.largestFreeSize);
    System_printf("totalFreeSize = %d\n", stats.totalFreeSize);
    System_printf("totalSize = %d\n", stats.totalSize);
#endif
}

/*
 *  ======== idl0Fxn ========
 */
Void idl0Fxn()
{
    BIOS_exit(0);
}
