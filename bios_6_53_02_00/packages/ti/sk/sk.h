/*
 *
 * Copyright (c) 2012, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
*/
/*
 *  ======== sk.h ========
 *
 *! Revision History
 *! ================
 *! 13-Sep-2006 rt	Fixed SK_allocSC proto, added new API protos
 *! 03-Mar-2006 rt	Added SK_EINVAL
 *! 09-May-2005 rt	Added C-callable API prototypes plus full API ref
 *! ??-???-???? rt	Created
 */

#ifndef _SK_
#define _SK_

/* #include "sk_load.h" */

typedef struct SK_LoadObj_s
{
    unsigned int loadModMagic;
    short        nSections;
    short        modHeaderSize;
    unsigned int sessionKey0;
    unsigned int sessionKey1;
    unsigned int sessionKey2;
    unsigned int sessionKey3;
    unsigned int nEntryPoints;
    unsigned int ep;            /* Actually an array pointer of entry points */
    unsigned int signature;     /* pointer to RSA signature */
} SK_LoadObj;

/*
 *  ======== SK_registerOSSWE ========
 *  SK_registerOSSWE is used by an OS to register a handler for OS
 *  system calls.  Must be called from supervisor privilege level.
 *
 *  The OS handler is called as if the hardware invoked its handler
 *  directly, i.e., interrupts are disabled, a copy of the TSR at the
 *  time of the SWE assembly instruction is in NTSR, and the proper
 *  return address is in NRP.
 *
 *  Parameters
 *      void *OSHandler - pointer to OS system call dispatcher
 *
 *  Return value(s)
 *      SK_EPRIV - error return if not called from supervisor privilege
 *          level
 */
int SK_registerOSSWE(void *OSHandler);

/*
 *  ======== SK_registerOSHWE ========
 *  SK_registerOSHWE is used by an OS to register a handler for
 *  exceptions and legacy NMI occurences.  Must be called from supervisor
 *  privilege level.
 *
 *  An exception indicates a corrupt system, and therefore a return
 *  from the handler should not be performed.
 *
 *  Parameters
 *      void *OSHandler - pointer to OS exception handler
 *
 *  Return value(s)
 *      SK_EPRIV - error return if not called from supervisor privilege
 *          level
 */
int SK_registerOSHWE(void *OSHandler);

/*
 *  ======== SK_registerOSIntr ========
 *  SK_registerOSIntr is used by an OS to register a handler for
 *  an interrupt.  Must be called from supervisor privilege level.
 *
 *  The OS handler is called as if the hardware invoked its handler
 *  directly, i.e., interrupts are disabled, a copy of the TSR at the
 *  time of the interrupt is in ITSR, and the proper return address
 *  is in IRP.
 *
 *  Parameters
 *	unsigned intrNum - interrupt number (2-15)
 *      void *OSHandler - pointer to OS exception handler
 *
 *  Return value(s)
 *      SK_EPRIV - error return if not called from supervisor privilege
 *          level
 */
int SK_registerOSIntr(unsigned intrNum, void *OSHandler);

/*
 *  ======== SK_downcallOS ========
 *  SK_downcallOS is used by a secure algorithm (user or supervisor) to
 *  make an OS system call.  Must be called from secure code.
 *
 *  The OS system call handler (registered with SK_registerOSSWE) is
 *  called with system call number contained in register B0.
 *
 *  Consult the OS's documentation for further details about OS system
 *  calls.
 *
 *  Parameters
 *	unsigned syscallNum - OS system call number (OS-dependent)
 *	... - not really varargs; parameter list as required by syscall
 *
 *  Return value(s)
 *      SK_ECTX - error return if current context number is invalid
 *      SK_ESTACK - error return if current secure stack doesn't have
 *          enough space to save context before the downcall
 *      SK_ESECLEVEL - error return if not called from secure code
 *      * - return value from OS syscall
 *
 * int SK_downcallOS(unsigned syscallNum, ...);
 */
int SK_downcallOS();

/*
 *  ======== SK_registerSCWP ========
 *  SK_registerSCWP is used by an OS to register the address of an
 *  unsigned integer that contains the current stack context identifier.
 *  It also takes a parameter containing the desired number of stack
 *  contexts for SK to manage, for the purpose of controlling the stack
 *  size of each stack context.  Must be called from supervisor privilege
 *  level.
 *
 *  The scwp parameter points to an integer that is updated by the OS
 *  during context switches.  Each thread that needs to make a stack-based
 *  system call (SK_load, SK_algoInvoke) must have an associated stack
 *  context reserved for it (through SK_allocSC), and the SCW (stack
 *  context word) must be written with the stack context identifier for
 *  the current thread.  A value of -1 is used for threads that don't
 *  have an associated stack context.
 *
 *  The numSC parameter informs SK how many stack contexts to manage.
 *  This is used to control the size of the stack for each secure context.
 *  The SK manages a single block of memory for all secure stacks, and
 *  this block can be subdivided into 1, 2, or 4 secure contexts.  With
 *  one context, the whole stack block is used for the single secure
 *  context.  With four contexts, the stack block is divided into four
 *  equal-sized blocks, one for each stack context.  This support allows
 *  for a large stack when needed, while allowing for more secure contexts
 *  when needed.
 *
 *  There should not be any allocated stack contexts when calling this
 *  API.
 *
 *  Parameters
 *	int *scwp - address of secure context identifier
 *	unsigned numSC - number of secure contexts to manage (1/2/4 only)
 *
 *  Return value(s)
 *      int scwp, if successful
 *      SK_EPRIV - error return if not called from supervisor privilege
 *          level
 *      SK_EINUSE - error return if any secure context is allocated
 *      SK_ECTX - error return if numSC is bad (not 1/2/4)
 */
int SK_registerSCWP(int *scwp, unsigned numSC);

/*
 *  ======== SK_load ========
 *  SK_load is used by an OS to load an encrypted algorithm into secure
 *  internal memory.  Typically, the algorithm will run with user
 *  privilege level, but there is also support for loading a supervisor
 *  privilege level algorithm.  The encrypted load module is encrypted
 *  and signed by a 3rd party, using a key and signature known only to
 *  the 3rd party.  Once loaded into secure internal RAM, it cannot be
 *  observed or debugged by anyone without special, proprietary
 *  knowledge.  Must be called from supervisor privilege level.
 *
 *  A load module can contain multiple entry points.  Upon a successful
 *  load, the passed entryPoints array will be loaded with the integer
 *  IDs of the entry points, so it must have enough space to hold all
 *  the entry points in the load module.  These entry points are then
 *  used in the SK_algoInvoke API.  The algorithm provider should
 *  document the order in which the entry points are laid out, since
 *  the SK_load API stores them into the passed entryPoints array in that
 *  same ordering.
 *
 *  Upon successful loading, an algorithm ID is returned.  This ID is
 *  in the range 2-15 (0 reserved for "no owner", 1 reserved for SK)
 *  and is passed to the SK_unload API.
 *
 *  This API utilizes IDMA1 for loading the code/data into secure memory.
 *  Thus, IDMA1 must not be in use when invoking the SK_load API.
 *
 *  A secure context must be allocated for any thread that calls the
 *  SK_load API, else an error is returned.  Also, a secure context must
 *  be allocated for any thread that calls the SK_agloInvoke API, else
 *  an error will be returned from SK_algoInvoke.
 *
 *  This API uses a large amount of secure stack.  As of this writing,
 *  it uses more stack than is available when 4 stack contexts are
 *  configured.  It is therefore necessary to reduce the number of
 *  secure contexts to 1 or 2 (using the SK_registerSCWP API) before
 *  calling the API.  The number of stack contexts can then be
 *  increased back to 4 after the call, if so desired.
 *
 *  Parameters
 *      SK_LoadObj *loadMod - pointer to encrypted load module
 *      unsigned entryPoints[] - array for storing loaded entry points
 *
 *  Return value(s)
 *	int load module ID, if successful
 *      SK_ECTX - error return if current context number is invalid
 *      SK_ESTACK - error return if secure stack for the current
 *          stack context doesn't have enough space for the call
 *      SK_ESECLEVEL - error return if not called from non-secure code
 *      SK_ELOADMAGIC - error return if load module header magic number
 *          is bad
 *      SK_ESECTMAGIC - error return if one of the load module's
 *          section headers contains a bad magic number
 *      SK_EDECODE - error return if the load module header did not
 *          decode properly (computed signature did not compare to load
 *          module signature) or if one of the computed section data
 *          checksums was invalid or if the number of entry points in
 *          the section data did not match the number stated in the load
 *          module header
 *      SK_EID - error return if no more algorithm IDs are available
 *      SK_EEP - error return if no more internal entry point storage
 *          is available
 *      SK_EINUSE - error return if any of the algorithm's pages are
 *          already in use by SK or another algorithm (reflects bad
 *          linkage)
 */
int SK_load(SK_LoadObj *loadModule, unsigned entryPoints[]);

/*
 *  ======== SK_unload ========
 *  SK_unload is used by an OS to unload a loaded secure algorithm
 *  that was previously loaded with SK_load.  Must be called from
 *  supervisor privilege level.
 *
 *  This API utilizes IDMA1 for clearing the code/data from secure memory.
 *  Thus, IDMA1 must not be in use when invoking the SK_unload API.
 *
 *  Parameters
 *	unsigned loadModID - ID returned by SK_load
 *
 *  Return value(s)
 *      SK_EID - error return if algoID is bad
 */
int SK_unload(unsigned loadModID);

/*
 *  ======== SK_algoInvoke ========
 *  SK_algoInvoke is used by application code to invoke algorithm entry
 *  points that were loaded by SK_load.  It must be called by non-secure
 *  code.  The entryPointID is one of the entry points returned from the
 *  SK_load API.  The algorithm provider should document the order in
 *  which the entry points are laid out, since the SK_load API stores
 *  them into the passed entryPoints array in that same ordering.
 *
 *  A secure context must be allocated for any thread that uses the
 *  SK_algoInvoke API, or else an error will be returned from
 *  SK_algoInvoke.
 *
 *  Following the entryPointID, the remaining parameters are passed
 *  directly to the invoked algorithm.
 *
 *  Parameters
 *	unsigned entryPointID - entry point ID returned by SK_load
 *	... - not really varargs; parameter list as required by
 *          algorithm entry point
 *
 *  Return value(s)
 *      SK_EID - error return if entry point ID is not in range
 *      SK_EPINVALID - error return if entry point is 0
 *      SK_ESECLEVEL - error return if not called from non-secure code
 *      SK_ECTX - error return if current context number is invalid
 *      SK_ESTACK - error return if secure stack for the current
 *          stack context doesn't have enough space for the call
 *      * - return value from algorithm entry point
 *
 *  int SK_algoInvoke(unsigned entryPointID, ...);
 */
int SK_algoInvoke();

/*
 *  ======== SK_allocSC ========
 *  SK_allocSC is used by an OS to allocate a secure context on behalf
 *  of a thread.  A secure context must be allocated for threads that
 *  will be making an SK_load or SK_algoInvoke API.
 *
 *  The two parameters to SK_allocSC define a non-secure stack block
 *  for the allocated context.  This merely tells SK the range of the
 *  non-secure stack pointer to expect when the allocated context is
 *  in use.  Using this stack block, SK will check that the SP is in
 *  range when returning from a downcall.
 *
 *  Parameters
 *      unsigned nsStackBottom - lower address of non-secure stack
 *      unsigned nsStackTop - upper address of non-secure stack (+ 1)
 *
 *  Return value(s)
 *      int secure context ID, if successful
 *      SK_EID - error return if no secure contexts are available
 */
int SK_allocSC(unsigned nsStackBottom, unsigned nsStackTop);

/*
 *  ======== SK_freeSC ========
 *  SK_freeSC is used by an OS to free a secure context that was
 *  allocated with SK_allocSC.
 *
 *  Parameters
 *      unsigned contextID - secure context ID obtained with SK_allocSC
 *
 *  Return value(s)
 *      SK_EID - error return if contextID is bad
 */
int SK_freeSC(int contextID);

/*
 *  ======== SK_setPDC ========
 *  SK_setPDC is used by an OS to set a PowerDown Controller mode.  Only
 *  those modes allowed by SK to be set are valid.  Must be called from
 *  supervisor privilege level.
 *
 *  Parameters
 *      unsigned mode - index into table of allowed modes
 *
 *  Return value(s)
 *      SK_EID - error return if mode is bad
 *      SK_EPRIV - error return if not called from supervisor privilege
 *          level
 */
int SK_setPDC(unsigned mode);

/*
 *  ======== SK_cacheL1DChangeSize ========
 *  SK_cacheL1DChangeSize is used by an OS to change the size of the
 *  L1D cache.  Only those sizes allowed by SK to be set are valid.
 *
 *  The maximum size of the cache depends on the chip implementation.
 *  SK therefore limits the size to the maximum for a particular chip.
 *  If the passed size is greater than the maximum, the maximum size
 *  is instead used.
 *
 *  If the cache size is increasing, and any of the pages below the
 *  new part of the cache are marked secure, the operation aborts.
 *
 *  Parameters
 *      unsigned size - size value to be written to L1DCFG
 *
 *  Return value(s)
 *	None
 */
void SK_cacheL1DChangeSize(unsigned size);

/*
 *  ======== SK_cacheL1PChangeSize ========
 *  SK_cacheL1PChangeSize is used by an OS to change the size of the
 *  L1P cache.  Only those sizes allowed by SK to be set are valid.
 *
 *  The maximum size of the cache depends on the chip implementation.
 *  SK therefore limits the size to the maximum for a particular chip.
 *  If the passed size is greater than the maximum, the maximum size
 *  is instead used.
 *
 *  If the cache size is increasing, and any of the pages below the
 *  new part of the cache are marked secure, the operation aborts.
 *
 *  Parameters
 *      unsigned size - size value to be written to L1PCFG
 *
 *  Return value(s)
 *	None
 */
void SK_cacheL1PChangeSize(unsigned size);

/*
 *  ======== SK_cacheL2ChangeSize ========
 *  SK_cacheL2ChangeSize is used by an OS to change the size of the
 *  L2 cache.  Only those sizes allowed by SK to be set are valid.
 *
 *  The maximum size of the cache depends on the chip implementation.
 *  SK therefore limits the size to the maximum for a particular chip.
 *  If the passed size is greater than the maximum, the maximum size
 *  is instead used.
 *
 *  If the cache size is increasing, and any of the pages below the
 *  new part of the cache are marked secure, the operation aborts.
 *
 *  Parameters
 *      unsigned size - size value to be written to L2CFG
 *
 *  Return value(s)
 *	None
 */
void SK_cacheL2ChangeSize(unsigned size);

/*
 *  ======== SK_getUID ========
 *  SK_getUID returns the reduced SHA-1 hash of the three internal
 *  keys in the DaVinci device (CEK/KEK/MPK).  This can be used
 *  as a semi-unique device value.
 *
 *  Parameters
 *      none
 *
 *  Return value
 *      Unique device ID
 */
long long SK_getUID();

/*
 *  ======== SK_setDelegateKey ========
 *  SK_setDelegateKey allows the user to install a new device
 *  certificate.  The device certificate has to be signed by
 *  the current signature key, and encrypted by the current
 *  encryption key.  If the value 0 is passed, the original
 *  CEK and root public key will be re-installed.
 *
 *  Parameters
 *      unsigned keyCert - pointer to the certificate
 *
 *  Return value(s)
 *      SK_EBADRPK - bad Root Public Key
 *      SK_EBADSIGN - bad signature
 */
int  SK_setDelegateKey(unsigned keyCert);

/*
 *  ======== SK_setMAR ========
 *  SK_setMAR allows the user to set any of the MAR registers
 *  to either enable or disabled caching of the associated
 *  memory region.
 *
 *  Parameters
 *      unsigned reg - MAR register index 0..255
 *      unsigned val - MAR register value 0..1
 *
 *  Return value(s)
 *      none
 *
 *  Note: parameter values are forced within the specified
 *  ranges by masking the parameters down to 8 bits and 1 bit
 *  respectively.
 */
void SK_setMAR(unsigned marNum, unsigned value);

/*
 *  ======== SK_setEventReg ========
 *  SK_setEventReg allows the user to set any of the event MMRs
 *  in the region 0x01800000..0x018001FC.
 *
 *  Parameters
 *      unsigned reg - event register index 0..127
 *      unsigned val - new event register value
 *
 *  Return value(s)
 *      none
 *
 *  Note: parameter values for the register index is forced within the
 *  specified range by masking it down to 7 bits.
 */
void SK_setEventReg(unsigned reg, unsigned val);

void SK_eventMap(unsigned vectId, unsigned eventId);

unsigned short int SK_secureKey(unsigned short int *blockIn, unsigned short int *blockSizeUint16, unsigned short int format);

/*
 * General error codes returned from SK C interfaces.
 */
#define SK_ESTACK	-1		/* bad secure/non-secure stack */
#define SK_ECTX		-2		/* bad secure context ID */
#define SK_ESECLEVEL	-3		/* API called from wrong sec */
#define SK_ELOADMAGIC	-4		/* bad algo load header magic */
#define SK_ESECTMAGIC	-5		/* bad algo sect header magic */
#define SK_EDECODE	-6		/* algo decoding error */
#define SK_EINUSE	-7		/* algo memory already in use */
#define SK_EID		-8		/* no available or bad algo ID */
#define SK_EEP		-9		/* no available algo EP slot */
#define SK_EEPINVALID	-10		/* bad entry point index for invoke */
#define SK_EPRIV	-11		/* bad privilege level */
#define SK_EBADRPK	-12		/* bad Root Public Key */
#define SK_EBADSIGN	-13		/* bad signature */
#define SK_EINVAL	-14		/* general "invalid value" */

#endif /* !_SK_ */
