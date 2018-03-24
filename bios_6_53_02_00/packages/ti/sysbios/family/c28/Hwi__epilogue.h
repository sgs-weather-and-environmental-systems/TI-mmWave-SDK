/*
 * Copyright (c) 2013-2014, Texas Instruments Incorporated
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
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern UInt ti_sysbios_family_c28_Hwi_enable__E();
extern UInt ti_sysbios_family_c28_Hwi_disable__E();
extern Void ti_sysbios_family_c28_Hwi_restore__E(UInt key);

/*
 *  ======== Hwi_disable ========
 */
inline UInt ti_sysbios_family_c28_Hwi_disable()
{
#ifdef ti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D
 #if ti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D == 0
    return (_disable_interrupts());
 #else
    return (ti_sysbios_family_c28_Hwi_disable__E());
 #endif
#else
    return (ti_sysbios_family_c28_Hwi_disable__E());
#endif
}


/*
 *  ======== Hwi_enable ========
 */
inline UInt ti_sysbios_family_c28_Hwi_enable()
{
#ifdef ti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D
 #if ti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D == 0
    return (_enable_interrupts());
 #else
    return (ti_sysbios_family_c28_Hwi_enable__E());
 #endif
#else
    return (ti_sysbios_family_c28_Hwi_enable__E());
#endif
}

/*
 *  ======== Hwi_restore ========
 */
inline Void ti_sysbios_family_c28_Hwi_restore(UInt key)
{
#ifdef ti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D
 #if ti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D == 0
    _restore_interrupts(key);
 #else
    ti_sysbios_family_c28_Hwi_restore__E(key);
 #endif
#else
    ti_sysbios_family_c28_Hwi_restore__E(key);
#endif
}

#ifdef __cplusplus
}
#endif
