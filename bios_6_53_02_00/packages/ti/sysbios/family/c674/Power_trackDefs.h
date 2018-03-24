/*
 * Copyright (c) 2012-2014, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQueueNTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== Power_trackDefs.h ========
 *
 *  Shared definitions for resource tracking.
 *
 */

#ifdef __cplusplus
extern "C" {
#endif

/* HW module's terminal LPSC states */
#define SWRSTDISABLE   0x0                      /* SwRstDisable */
#define DISABLE        0x2                      /* Disable */
#define ENABLE         0x3                      /* Enable */
#define FORCE_BIT      0x80000000               /* force control bit */

/* threshold on # of LPSC state transition checks before declaring failure */
#define PSCWAITTHRESHOLD 3250                   /* approx 1msec @ 300MHz */

/* resource special behavior flags */
#define VALID          0x1                      /* DSP-side control is OK */
#define ALWAYSUSESH    0x2                      /* always use SH if defined */
#define FORCE_MODE     0x4                      /* force the transition */

/* Power special handler function type */
typedef Bool (*Power_SpecialHandlerFxn)(UInt resourceID, UInt mode);

/* Power resource database record format */
typedef struct Power_ResourceRecord {
    Power_SpecialHandlerFxn specialHandler;
    UInt32 count;
    UInt8 pscNum;
    UInt8 lpscNum;
    UInt8 inactiveState;
    UInt8 flags;
} Power_ResourceRecord;

#ifdef __cplusplus
}
#endif
