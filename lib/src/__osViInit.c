#include "libultra_internal.h"
#include "hardware.h"

extern s32 D_SH_80000300; // Potentially a TV type

extern u32 osTvType;

OSViContext sViContexts[2] = { 0 };
OSViContext *__osViCurr = &sViContexts[0];
OSViContext *__osViNext = &sViContexts[1];

extern OSViMode D_80334990;
extern OSViMode D_803349E0;
extern OSViMode D_80302FD0;

void __osViInit(void) {
// > a jp ifdef is placed here...
    bzero(sViContexts, sizeof(sViContexts));
    __osViCurr = &sViContexts[0];
    __osViNext = &sViContexts[1];
    __osViNext->retraceCount = 1;
    __osViCurr->retraceCount = 1;

    __osViNext->buffer = (void *) 0x80000000;
    __osViCurr->buffer = (void *) 0x80000000;
    if (osTvType == TV_TYPE_PAL) {
        __osViNext->modep = &D_80334990;
    } else if (osTvType == TV_TYPE_MPAL) {
        __osViNext->modep = &D_803349E0;
    } else {
        __osViNext->modep = &D_80302FD0;
    }

    __osViNext->unk00 = 0x20;
    __osViNext->features = __osViNext->modep->comRegs.ctrl;
    while (HW_REG(VI_CURRENT_REG, u32) > 0xa) {
        ;
    }
    HW_REG(VI_STATUS_REG, u32) = 0;
    __osViSwapContext();
}
