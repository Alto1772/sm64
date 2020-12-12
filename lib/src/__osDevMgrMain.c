#include "libultra_internal.h"
#include "macros.h"

#include "new_func.h"

void __osDevMgrMain(void *args) {
    OSIoMesg *mb;
    OSMesg em;
    OSMesg dummy;
    s32 ret;
    OSMgrArgs *sp34;
    u32 sp2c;
    __OSBlockInfo *sp28;
    __OSTranxInfo *sp24;
    u32 tmp;
    sp2c = 0;
    mb = NULL;
    ret = 0;
    sp34 = (OSMgrArgs *) args;
    while (TRUE) {
        osRecvMesg(sp34->cmdQueue, (OSMesg) &mb, OS_MESG_BLOCK);
        if (mb->piHandle != NULL && mb->piHandle->type == 2
            && (mb->piHandle->transferInfo.cmdType == 0
                || mb->piHandle->transferInfo.cmdType == 1)) {
            sp24 = &mb->piHandle->transferInfo;
            sp28 = &sp24->block[sp24->blockNum];
            sp24->sectorNum = -1;
            if (sp24->transferMode != 3) {
                sp28->dramAddr = (void *) ((u32) sp28->dramAddr - sp28->sectorSize);
            }
            if (sp24->transferMode == 2 && mb->piHandle->transferInfo.cmdType == 0) {
                sp2c = 1;
            } else {
                sp2c = 0;
            }
            osRecvMesg(sp34->accessQueue, &dummy, OS_MESG_BLOCK);
            __osResetGlobalIntMask(0x00100401); // remove magic constant!
            __osEPiRawWriteIo(mb->piHandle, 0x05000510, (sp24->bmCtlShadow | 0x80000000));
            while (TRUE) {
                osRecvMesg(sp34->eventQueue, &em, OS_MESG_BLOCK);
                sp24 = &mb->piHandle->transferInfo;
                sp28 = &sp24->block[sp24->blockNum];
                if (sp28->errStatus == 0x1D) {
                    __osEPiRawWriteIo(mb->piHandle, 0x5000510, sp24->bmCtlShadow | 0x10000000);
                    __osEPiRawWriteIo(mb->piHandle, 0x5000510, sp24->bmCtlShadow);
                    __osEPiRawReadIo(mb->piHandle, 0x5000508, &tmp);
                    if ((tmp & 0x2000000) != 0) {
                        __osEPiRawWriteIo(mb->piHandle, 0x5000510, sp24->bmCtlShadow | 0x1000000);
                    }
                    sp28->errStatus = 4;
                    HW_REG(PI_STATUS_REG, u32) = PI_STATUS_CLEAR_INTR;
                    __osSetGlobalIntMask(0x100C01);
                }
                osSendMesg(mb->hdr.retQueue, mb, OS_MESG_NOBLOCK);
                if (sp2c != 1 || mb->piHandle->transferInfo.block[0].errStatus != 0) {
                    break;
                }
                sp2c = 0;
            }
            osSendMesg(sp34->accessQueue, NULL, OS_MESG_NOBLOCK);
            if (mb->piHandle->transferInfo.blockNum == 1) {
                func_802F71F0();
            }
        } else {
            switch (mb->hdr.type) {
                case 11:
                    osRecvMesg(sp34->accessQueue, &dummy, OS_MESG_BLOCK);
                    ret = sp34->dma_func(OS_READ, mb->devAddr, mb->dramAddr, mb->size);
                    break;
                case 12:
                    osRecvMesg(sp34->accessQueue, &dummy, OS_MESG_BLOCK);
                    ret = sp34->dma_func(OS_WRITE, mb->devAddr, mb->dramAddr, mb->size);
                    break;
                case 15:
                    osRecvMesg(sp34->accessQueue, &dummy, OS_MESG_BLOCK);
                    ret = sp34->edma_func(mb->piHandle, OS_READ, mb->devAddr, mb->dramAddr,
                                           mb->size);
                    break;
                case 16:
                    osRecvMesg(sp34->accessQueue, &dummy, OS_MESG_BLOCK);
                    ret = sp34->edma_func(mb->piHandle, OS_WRITE, mb->devAddr, mb->dramAddr,
                                           mb->size);
                    break;
                case 10:
                    osSendMesg(mb->hdr.retQueue, mb, OS_MESG_NOBLOCK);
                    ret = -1;
                    break;
                    break;
                default:
                    ret = -1;
                    break;
            }
            if (ret == 0) {
                osRecvMesg(sp34->eventQueue, &em, OS_MESG_BLOCK);
                osSendMesg(mb->hdr.retQueue, mb, OS_MESG_NOBLOCK);
                osSendMesg(sp34->accessQueue, NULL, OS_MESG_NOBLOCK);
            }
        }
    }
}
