/**
 *   @file  mmwave_internal.h
 *
 *   @brief
 *      This is the internal Header for the mmWave module. This header file
 *      should *NOT* be directly included by applications.
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2016 Texas Instruments, Inc.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
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
 */
#ifndef MMWAVE_INTERNAL_H
#define MMWAVE_INTERNAL_H

#include <ti/common/mmwave_error.h>
#include <ti/drivers/crc/crc.h>
#include <ti/drivers/osal/SemaphoreP.h>
#include <ti/drivers/mailbox/mailbox.h>
#include <ti/control/mmwave/include/mmwave_listlib.h>

#ifdef __cplusplus
extern "C" {
#endif

/** @addtogroup MMWAVE_INTERNAL_DEFINITIONS
 @{ */

/**
 * @brief
 *  This defines the maximum number of entries in the spawn list.
 */
#define MMWAVE_MAX_NUM_SPAWN_LIST           4U

/**
 * @brief   Status flag to indicate the open state
 */
#define MMWAVE_STATUS_OPENED                1U

/**
 * @brief   Status flag to indicate the configured state
 */
#define MMWAVE_STATUS_CONFIGURED            2U

/**
 * @brief   Status flag to indicate the synchronization state
 */
#define MMWAVE_STATUS_SYNCHRONIZED          4U

/**
 * @brief   Status flag to indicate the started state
 */
#define MMWAVE_STATUS_STARTED               8U

/**
 * @brief   Link Status flag used to indicate that the RF was initialized successfully
 */
#define MMWAVE_RF_INITIALIZED               1U

/**
 * @brief   Link Status flag used to indicate that the RF initialization failed.
 */
#define MMWAVE_RF_INIT_FAILED               2U

/**
 * @brief   Link Status flag used to indicate that the RF Calibration completed
 */
#define MMWAVE_RF_CALIBRATION_DONE          4U

/**
 * @brief   Link Status flag used to indicate that the Calibration failed
 */
#define MMWAVE_RF_CALIBRATION_FAILED        8U

/**
 * @brief   Link Status flag used to indicate that the ESM fault was detected
 */
#define MMWAVE_RF_ESM_FAULT                 16U

/**
 * @brief   Link Status flag used to indicate that the CPU fault was detected
 */
#define MMWAVE_RF_CPU_FAULT                 32U

/**
 * @brief   Link Status flag used to indicate that the Analog fault was detected
 */
#define MMWAVE_RF_ANALOG_FAULT              64U

/**
@}
*/

/** @addtogroup MMWAVE_INTERNAL_DATA_STRUCTURE
 @{ */

/**
 * @brief
 *  mmWave Spawn function entry
 *
 * @details
 *  The structure is used to keep track of the spawn functions which
 *  need to be executed by the control module.
 */
typedef struct MMWave_SpawnFxnNode_t
{
    /**
     * @brief   Links to the other elements in the list
     */
    MMWave_ListNode         links;

    /**
     * @brief   Spawn function entry
     */
    RL_P_OSI_SPAWN_ENTRY    spawnEntry;

    /**
     * @brief   Argument passed to the spawn function
     */
    const void*             arg;
}MMWave_SpawnFxnNode;

/**
 * @brief
 *  mmWave Chirp configuration
 *
 * @details
 *  The structure is used to keep track of the chirps which
 *  have been configured in the system.
 */
typedef struct MMWave_Chirp_t
{
    /**
     * @brief   Links to the other elements in the list
     */
    MMWave_ListNode             links;

    /**
     * @brief   Chirp configuration
     */
    rlChirpCfg_t                chirpCfg;

    /**
     * @brief   Profile for which the chirp is configured
     */
    struct MMWave_Profile_t*    ptrMMWaveProfile;
}MMWave_Chirp;

/**
 * @brief
 *  mmWave Profile configuration
 *
 * @details
 *  The structure is used to keep track of the profiles
 */
typedef struct MMWave_Profile_t
{
    /**
     * @brief   Links to the other elements in the list
     */
    MMWave_ListNode         links;

    /**
     * @brief   Profile configuration
     */
    rlProfileCfg_t          profileCfg;

    /**
     * @brief   Link to the mmWave
     */
    struct MMWave_MCB_t*    ptrMMWaveMCB;

    /**
     * @brief   Number of chirps
     */
    uint32_t                numChirps;

    /**
     * @brief   List of all the chirps associated with the profile
     */
    MMWave_Chirp*           ptrChirpList;
}MMWave_Profile;

/**
 * @brief
 *  mmWave BPM configuration
 *
 * @details
 *  The structure is used to keep track of the BPM configurations
 */
typedef struct MMWave_BpmChirp_t
{
    /**
     * @brief   Links to the other elements in the list
     */
    MMWave_ListNode         links;

    /**
     * @brief   Profile configuration
     */
    rlBpmChirpCfg_t         bpmChirp;

    /**
     * @brief   Link to the mmWave
     */
    struct MMWave_MCB_t*    ptrMMWaveMCB;
    
}MMWave_BpmChirp;

/**
 * @brief
 *  mmWave Control MCB
 *
 * @details
 *  The structure is used to store all the relevant information required
 *  to execute the mmWave control module.
 */
typedef struct MMWave_MCB_t
{
    /**
     * @brief   Initialization configuration which was used to initialize the
     * control module.
     */
    MMWave_InitCfg              initCfg;

    /**
     * @brief   Configuration which is used to open the control module.
     */
    MMWave_OpenCfg              openCfg;

    /**
     * @brief   Calibration configuration which is used to start the control module
     */
    MMWave_CalibrationCfg       calibrationCfg;

    /**
     * @brief   DFE Data output mode: This is valid only when the mmWave module is in
     * the following states:-
     *  Full Configuration    - Configured State
     *  Minimal Configuration - Start State
     */
    MMWave_DFEDataOutputMode    dfeDataOutputMode;

    /**
     * @brief   Handle to the BSS Mailbox: This is used to communicate the mmWave
     * link messages to the BSS
     */
    Mbox_Handle              bssMailbox;

    /**
     * @brief   CRC Driver channel handle: This is the handle to the CRC driver
     * if configured to use the driver else this is set to NULL.
     */
    CRC_Handle                  crcHandle;

    /**
     * @brief   This is the semaphore handle which is used to handle the messages exchanged
     * between the MSS/DSS and BSS.
     */
    SemaphoreP_Handle           linkSemHandle;

    /**
     * @brief   This is the semaphore handle which is used to protect the chirp/profile
     * configuration while operating in FULL configuration mode.
     */
    SemaphoreP_Handle           cfgSemHandle;

    /**
     * @brief   This is the spawn table used by the free & active lists.
     */
    MMWave_SpawnFxnNode         spawnTable[MMWAVE_MAX_NUM_SPAWN_LIST];

    /**
     * @brief   List which tracks all the nodes in the spawn free list.
     */
    MMWave_SpawnFxnNode*        ptrSpawnFxnFreeList;

    /**
     * @brief   List which tracks all the nodes in the spawn list which are
     * to be executed.
     */
    MMWave_SpawnFxnNode*        ptrSpawnFxnActiveList;

    /**
     * @brief   List which tracks all the profiles which have been created
     */
    MMWave_Profile*             ptrProfileList;
    
    /**
     * @brief   List which tracks all the BPM configurations which have been created
     */
    MMWave_BpmChirp*              ptrBpmChirpList;

    /**
     * @brief   Status of the mmWave Link: This can be changed from multiple execution
     * contexts
     */
    volatile uint32_t           linkStatus;

    /**
     * @brief   Status of the mmWave control module:
     */
    uint32_t                    status;

    /**
     * @brief   Counter which tracks the number of times the spawn list overflowed
     */
    uint32_t                    spawnOverflow;

    /**
     * @brief   Counter which tracks the number of times the spawn was invoked
     */
    uint32_t                    spawnCounter;

    /**
     * @brief   Counter which tracks the number of times the write reset was invoked
     */
    uint32_t                    wResetCounter;

    /**
     * @brief   Version Information which is stored once the link is operational
     */
    rlVersion_t                 version;
}MMWave_MCB;

/**
@}
*/

/* Global mmWave Control MCB: */
extern MMWave_MCB           gMMWave_MCB;

/***************************************************************************************
 * Internal Link Exported API:
 ***************************************************************************************/
extern int32_t MMWave_initLink (MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deinitLink (MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_openLink (MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_closeLink (MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_executeLink (MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_configLink (MMWave_MCB* ptrMMWaveMCB, MMWave_CtrlCfg* ptrControlCfg, int32_t* errCode);
extern int32_t MMWave_startLink (MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_stopLink (const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);

/***************************************************************************************
 * Internal Platform specific Exported API:
 ***************************************************************************************/
extern void    MMWave_deviceGetDeviceInfo (const MMWave_MCB* ptrMMWaveMCB, rlUInt8_t* devType, rlUInt8_t* platform);
extern int32_t MMWave_deviceCfgAsyncEvent(const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceInitFxn(MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceDeinitFxn(MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceOpenFxn(const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceCloseFxn(const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceSyncFxn(const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceCfgFxn (const MMWave_MCB* ptrMMWaveMCB, MMWave_CtrlCfg* ptrControlCfg, int32_t* errCode);
extern int32_t MMWave_deviceStartFxn(const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceStopFxn(const MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern int32_t MMWave_deviceExecuteFxn(MMWave_MCB* ptrMMWaveMCB, int32_t* errCode);
extern void    MMWave_deviceEventFxn(const MMWave_MCB* ptrMMWaveMCB, uint16_t msgId, uint16_t sbId, uint16_t sbLen, uint8_t* payload);

/***************************************************************************************
 * Error Management API:
 ***************************************************************************************/
extern int32_t MMWave_encodeError (MMWave_ErrorLevel errorLevel, int32_t mmWaveError, int32_t subSysError);
extern MMWave_ErrorLevel MMWave_decodeErrorLevel (int32_t errCode);

/***************************************************************************************
 * Link OSAL Exported API:
 ***************************************************************************************/
extern rlInt32_t MMWave_osalMutexCreate(rlOsiMutexHdl_t* mutexHandle, rlInt8_t* name);
extern rlInt32_t MMWave_osalMutexLock(rlOsiMutexHdl_t* mutexHandle, rlOsiTime_t timeout);
extern rlInt32_t MMWave_osalMutexUnlock(rlOsiMutexHdl_t* mutexHandle);
extern rlInt32_t MMWave_osalMutexDelete(rlOsiMutexHdl_t* mutexHandle);
extern rlInt32_t MMWave_osalSemCreate(rlOsiSemHdl_t* semHandle, rlInt8_t* name);
extern rlInt32_t MMWave_osalSemWait(rlOsiSemHdl_t* semHandle, rlOsiTime_t timeout);
extern rlInt32_t MMWave_osalSemSignal(rlOsiSemHdl_t* semHandle);
extern rlInt32_t MMWave_osalSemDelete(rlOsiSemHdl_t* semHandle);

#ifdef __cplusplus
}
#endif

#endif /* MMWAVE_INTERNAL_H */

