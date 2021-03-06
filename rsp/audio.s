.rsp

.include "rsp/rsp_defs.inc"

// This file assumes DATA_FILE and CODE_FILE are set on the command line

.if version() < 110
    .error "armips 0.11 or newer is required"
.endif

.macro jumpTableEntry, addr
  .dh addr & 0xFFFF
.endmacro

// Audio flags
A_INIT     equ 0x01
A_CONTINUE equ 0x00
A_LOOP     equ 0x02
A_OUT      equ 0x02
A_LEFT     equ 0x02
A_RIGHT    equ 0x00
A_VOL      equ 0x04
A_RATE     equ 0x00
A_AUX      equ 0x08
A_NOAUX    equ 0x00
A_MAIN     equ 0x00
A_MIX      equ 0x10

.create DATA_FILE, 0x0000

.dh 0x0000, 0x0001, 0x0002, 0xffff, 0x0020, 0x0800, 0x7fff, 0x4000 // 0x00000000

// 0x10 - 0x1F: command dispatch table
dispatchTable:
  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_ADPCM
  jumpTableEntry cmd_CLEARBUFF
  jumpTableEntry cmd_SPNOOP

  jumpTableEntry cmd_ADDMIXER
  jumpTableEntry cmd_RESAMPLE
  jumpTableEntry cmd_RESAMPLE_ZOH
  jumpTableEntry cmd_SPNOOP

  jumpTableEntry cmd_SETBUFF
  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_DMEMMOVE
  jumpTableEntry cmd_LOADADPCM

  jumpTableEntry cmd_MIXER
  jumpTableEntry cmd_INTERLEAVE
  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_SETLOOP

  jumpTableEntry cmd_17e4
  jumpTableEntry cmd_INTERL
  jumpTableEntry cmd_ENVSETUP1
  jumpTableEntry cmd_ENVMIXER

  jumpTableEntry cmd_LOADBUFF
  jumpTableEntry cmd_SAVEBUFF
  jumpTableEntry cmd_ENVSETUP2
  jumpTableEntry cmd_1b78

  jumpTableEntry cmd_HILOGAIN
  jumpTableEntry cmd_1c7c
  jumpTableEntry cmd_DUPLICATE
  jumpTableEntry cmd_FILTER

  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_SPNOOP
  jumpTableEntry cmd_SPNOOP

.dh 0xf000, 0x0f00, 0x00f0, 0x000f, 0x0001, 0x0010, 0x0100, 0x1000 // 0x00000030
data0040:
.dh 0x0002, 0x0004, 0x0006, 0x0008, 0x000a, 0x000c, 0x000e, 0x0010 // 0x00000040
.dh 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001 // 0x00000050
.dh 0x0000, 0x0001, 0x0002, 0x0004, 0x0008, 0x0010, 0x0100, 0x0200 // 0x00000060
.dh 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000 // 0x00000070
.dh 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x0000 // 0x00000080
.dh 0x0000, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000 // 0x00000090
.dh 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x0000, 0x0000, 0x0001 // 0x000000a0
.dh 0x2000, 0x4000, 0x6000, 0x8000, 0xa000, 0xc000, 0xe000, 0xffff // 0x000000b0
.dh 0x0000, 0xFFFF, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.dh 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000
.dh 0x0c39, 0x66ad, 0x0d46, 0xffdf, 0x0b39, 0x6696, 0x0e5f, 0xffd8 // 0x000000c0
.dh 0x0a44, 0x6669, 0x0f83, 0xffd0, 0x095a, 0x6626, 0x10b4, 0xffc8 // 0x000000d0
.dh 0x087d, 0x65cd, 0x11f0, 0xffbf, 0x07ab, 0x655e, 0x1338, 0xffb6 // 0x000000e0
.dh 0x06e4, 0x64d9, 0x148c, 0xffac, 0x0628, 0x643f, 0x15eb, 0xffa1 // 0x000000f0
.dh 0x0577, 0x638f, 0x1756, 0xff96, 0x04d1, 0x62cb, 0x18cb, 0xff8a // 0x00000100
.dh 0x0435, 0x61f3, 0x1a4c, 0xff7e, 0x03a4, 0x6106, 0x1bd7, 0xff71 // 0x00000110
.dh 0x031c, 0x6007, 0x1d6c, 0xff64, 0x029f, 0x5ef5, 0x1f0b, 0xff56 // 0x00000120
.dh 0x022a, 0x5dd0, 0x20b3, 0xff48, 0x01be, 0x5c9a, 0x2264, 0xff3a // 0x00000130
.dh 0x015b, 0x5b53, 0x241e, 0xff2c, 0x0101, 0x59fc, 0x25e0, 0xff1e // 0x00000140
.dh 0x00ae, 0x5896, 0x27a9, 0xff10, 0x0063, 0x5720, 0x297a, 0xff02 // 0x00000150
.dh 0x001f, 0x559d, 0x2b50, 0xfef4, 0xffe2, 0x540d, 0x2d2c, 0xfee8 // 0x00000160
.dh 0xffac, 0x5270, 0x2f0d, 0xfedb, 0xff7c, 0x50c7, 0x30f3, 0xfed0 // 0x00000170
.dh 0xff53, 0x4f14, 0x32dc, 0xfec6, 0xff2e, 0x4d57, 0x34c8, 0xfebd // 0x00000180
.dh 0xff0f, 0x4b91, 0x36b6, 0xfeb6, 0xfef5, 0x49c2, 0x38a5, 0xfeb0 // 0x00000190
.dh 0xfedf, 0x47ed, 0x3a95, 0xfeac, 0xfece, 0x4611, 0x3c85, 0xfeab // 0x000001a0
.dh 0xfec0, 0x4430, 0x3e74, 0xfeac, 0xfeb6, 0x424a, 0x4060, 0xfeaf // 0x000001b0
.dh 0xfeaf, 0x4060, 0x424a, 0xfeb6, 0xfeac, 0x3e74, 0x4430, 0xfec0 // 0x000001c0
.dh 0xfeab, 0x3c85, 0x4611, 0xfece, 0xfeac, 0x3a95, 0x47ed, 0xfedf // 0x000001d0
.dh 0xfeb0, 0x38a5, 0x49c2, 0xfef5, 0xfeb6, 0x36b6, 0x4b91, 0xff0f // 0x000001e0
.dh 0xfebd, 0x34c8, 0x4d57, 0xff2e, 0xfec6, 0x32dc, 0x4f14, 0xff53 // 0x000001f0
.dh 0xfed0, 0x30f3, 0x50c7, 0xff7c, 0xfedb, 0x2f0d, 0x5270, 0xffac // 0x00000200
.dh 0xfee8, 0x2d2c, 0x540d, 0xffe2, 0xfef4, 0x2b50, 0x559d, 0x001f // 0x00000210
.dh 0xff02, 0x297a, 0x5720, 0x0063, 0xff10, 0x27a9, 0x5896, 0x00ae // 0x00000220
.dh 0xff1e, 0x25e0, 0x59fc, 0x0101, 0xff2c, 0x241e, 0x5b53, 0x015b // 0x00000230
.dh 0xff3a, 0x2264, 0x5c9a, 0x01be, 0xff48, 0x20b3, 0x5dd0, 0x022a // 0x00000240
.dh 0xff56, 0x1f0b, 0x5ef5, 0x029f, 0xff64, 0x1d6c, 0x6007, 0x031c // 0x00000250
.dh 0xff71, 0x1bd7, 0x6106, 0x03a4, 0xff7e, 0x1a4c, 0x61f3, 0x0435 // 0x00000260
.dh 0xff8a, 0x18cb, 0x62cb, 0x04d1, 0xff96, 0x1756, 0x638f, 0x0577 // 0x00000270
.dh 0xffa1, 0x15eb, 0x643f, 0x0628, 0xffac, 0x148c, 0x64d9, 0x06e4 // 0x00000280
.dh 0xffb6, 0x1338, 0x655e, 0x07ab, 0xffbf, 0x11f0, 0x65cd, 0x087d // 0x00000290
.dh 0xffc8, 0x10b4, 0x6626, 0x095a, 0xffd0, 0x0f83, 0x6669, 0x0a44 // 0x000002a0
.dh 0xffd8, 0x0e5f, 0x6696, 0x0b39, 0xffdf, 0x0d46, 0x66ad, 0x0c39 // 0x000002b0
.dh 0xFFFF, 0xDFFF, 0xBFFF, 0x9FFF, 0x7FFF, 0x5FFF, 0x3FFF, 0x1FFF
.dh 0x0000, 0x2000, 0x4000, 0x6000, 0x8000, 0xA000, 0xC000, 0xE000
.dh 0x0000, 0x0002, 0x0004, 0x0006, 0x0008, 0x000A, 0x000C, 0x000E

.definelabel segmentTable, 0x320
.definelabel audioStruct, 0x320

audio_in_buf        equ 0x00 // 0x360
audio_out_buf       equ 0x02 // 0x362
audio_count         equ 0x04 // 0x364
audio_vol_left      equ 0x06 // 0x366
audio_vol_right     equ 0x08 // 0x366
audio_aux_buf0      equ 0x0a // 0x36a
audio_aux_buf1      equ 0x0c // 0x36c
audio_aux_buf2      equ 0x0e // 0x36e
audio_loop_value    equ 0x10 // 0x370 (shared)
audio_target_left   equ 0x10 // 0x370 (shared)
audio_rate_hi_left  equ 0x12 // 0x372 (shared)
audio_rate_lo_left  equ 0x14 // 0x374
audio_target_right  equ 0x16 // 0x376
audio_rate_hi_right equ 0x18 // 0x378

.definelabel audio_rate_lo_right, 0x04 // 0x37a

audio_dry_gain      equ 0x1c // 0x37c
audio_wet_gain      equ 0x1e // 0x37e

.definelabel nextTaskEntry, 0x340
.definelabel adpcmTable,    0x3c0

.definelabel dmemBase,      0x5c0 // all samples stored that is transferred to DMEM
.definelabel tmpData,       0xF90 // temporary area

.close // DATA_FILE


.create CODE_FILE, 0x04001080

    addi  $24, $zero, audioStruct
    addi  $23, $zero, tmpData
    lw    $28, 0x30($1)        // task_data
    lw    $27, 0x34($1)        // task_data_size
    mfc0  $5, DPC_STATUS
    andi  $4, $5, DPC_STATUS_XBUS_DMA
    beqz  $4, @@audio_040010b4
     andi  $4, $5, DPC_STATUS_DMA_BUSY
    beqz  $4, @@audio_040010b4
     nop
@@dpc_dma_busy:
    mfc0  $4, DPC_STATUS
    andi  $4, $4, DPC_STATUS_DMA_BUSY
    bgtz  $4, @@dpc_dma_busy
@@audio_040010b4:
     nop
    jal   audio_04001150
     nop

dma_busy:
    mfc0  $2, SP_DMA_BUSY
    bnez  $2, dma_busy
     addi  $29, $zero, nextTaskEntry
    mtc0  $zero, SP_SEMAPHORE  // release semaphore
audio_040010e4:
    lw    $26, 0x00($29)       // first word of command
    lw    $25, 0x04($29)       // second word of command
    srl   $1, $26, 23          // cmd byte << 1
    andi  $1, $1, 0x00fe
    addi  $28, $28, 8
    addi  $27, $27, -8
    addi  $29, $29, 8
    addi  $30, $30, -8
    add   $2, $zero, $1
    lh    $2, (dispatchTable)($2)
    jr    $2
     nop
    break

cmd_SPNOOP:
    bgtz  $30, audio_040010e4
     nop
    blez  $27, @@audio_04001138
     nop
    jal   audio_04001150
     nop
    j     dma_busy
     nop
@@audio_04001138:
    ori   $1, $zero, 0x4000
    mtc0  $1, SP_STATUS
    break
    nop
@@forever:
    b     @@forever
     nop

audio_04001150:
    addi  $5, $ra, 0x0000
    add   $2, $zero, $28
    addi  $3, $27, 0x0000
    addi  $4, $3, -0x80
    blez  $4, @@audio_0400116c
     addi  $1, $zero, nextTaskEntry
    addi  $3, $zero, 0x80
@@audio_0400116c:
    addi  $30, $3, 0x0000
    jal   dma_read_start
     addi  $3, $3, -1
    addi  $29, $zero, nextTaskEntry
    jr    $5
     nop

dma_read_start:
    mfc0  $4, SP_SEMAPHORE
    bnez  $4, dma_read_start
     nop
@@dma_not_full:
    mfc0  $4, SP_DMA_FULL
    bnez  $4, @@dma_not_full
     nop
    mtc0  $1, SP_MEM_ADDR
    mtc0  $2, SP_DRAM_ADDR
    mtc0  $3, SP_RD_LEN
    jr    $ra
     nop

dma_write_start:
    mfc0  $4, SP_SEMAPHORE
    bnez  $4, dma_write_start
     nop
@@dma_not_full:
    mfc0  $4, SP_DMA_FULL
    bnez  $4, @@dma_not_full
     nop
    mtc0  $1, SP_MEM_ADDR
    mtc0  $2, SP_DRAM_ADDR
    mtc0  $3, SP_WR_LEN
    jr    $ra
     nop

cmd_CLEARBUFF:
    andi  $3, $25, 0xffff
    beqz  $3, cmd_SPNOOP
    andi  $2, $26, 0xffff
    vxor  $v0, $v0, $v0
    addi  $3, $3, -0x10
@@audio_040011f8:
    sdv   $v0[0], 0x0($2)
    sdv   $v0[0], 0x8($2)
    addi  $2, $2, 0x10
    bgtz  $3, @@audio_040011f8
     addi  $3, $3, -0x10
    j     cmd_SPNOOP
     nop

cmd_SEGMENT:

cmd_SETBUFF:
    srl   $2, $25, 16
    sh    $26, 0($24)
    sh    $2, 2($24)
    j     cmd_SPNOOP
     sh    $25, (audio_rate_lo_right)($24)

cmd_INTERLEAVE:
    andi  $a0, $k0, 0xffff
    srl   $at, $k0, 12
    andi  $at, $at, 0xff0
    andi  $v1, $t9, 0xffff
    srl   $v0, $t9, 16
@@audio_040013a8:
    ldv   $v1[0], 0x0($2)
    ldv   $v2[0], 0x0($3)
    addi  $at, $at, -8
    addi  $a0, $a0, 16
    ssv   $v1[0], 0xF0($4)
    ssv   $v1[2], 0xF4($4)
    addi  $v0, $v0, 8
    ssv   $v1[4], 0xF8($4)
    ssv   $v1[6], 0xFC($4)
    ssv   $v2[0], 0xF2($4)
    addi  $v1, $v1, 8
    ssv   $v2[2], 0xF6($4)
    ssv   $v2[4], 0xFA($4)
    bgtz  $1, @@audio_040013a8
     ssv   $v2[6], 0xFE($a0)
    j     cmd_SPNOOP
     nop

cmd_DMEMMOVE:
    andi  $1, $25, 0xffff
    beqz  $1, cmd_SPNOOP
     andi  $2, $26, 0xffff
    srl   $3, $25, 16
@@audio_04001424:
    ldv   $v1[0], 0x0($2)
    ldv   $v2[0], 0x8($2)
    addi  $1, $1, -0x10
    addi  $2, $2, 0x10
    sdv   $v1[0], 0x0($3)
    sdv   $v2[0], 0x8($3)
    bgtz  $1, @@audio_04001424
     addi  $3, $3, 0x10
    j     cmd_SPNOOP
     nop

cmd_SETLOOP:
    sll   $1, $25, 8
    srl   $1, $1, 8
    j     cmd_SPNOOP
     sw    $at, 0x10($t8)

cmd_ADPCM:
    lqv   $v31[0], 0x00($zero)
    vxor  $v27, $v27, $v27
    lhu   $21, (audio_in_buf)($24)
    vxor  $v25, $v25, $v25
    vxor  $v24, $v24, $v24
    addi  $20, $21, 1
    lhu   $19, (audio_out_buf)($24)
    vxor  $v13, $v13, $v13
    vxor  $v14, $v14, $v14
    lhu   $18, (audio_count)($24)
    vxor  $v15, $v15, $v15
    vxor  $v16, $v16, $v16
    sll   $s1, $t9, 8
    vxor  $v17, $v17, $v17
    vxor  $v18, $v18, $v18
    srl   $s1, $s1, 8
    vxor  $v19, $v19, $v19
    sqv   $v27[0], 0x00($19)
    sqv   $v27[0], 0x10($19)
    srl   $1, $26, 16
    andi  $1, $1, A_INIT
    bgtz  $1, @@audio_0400150c
     srl   $1, $26, 16
    andi  $1, $1, A_LOOP
    beq   $zero, $1, @@audio_040014f0
     addi  $2, $17, 0x00
    lw    $2, (audio_loop_value)($24)
@@audio_040014f0:
    addi  $1, $19, 0x0000
    jal   dma_read_start
     addi  $3, $zero, 0x1f
@@dma_read_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_read_busy
     nop
    mtc0  $zero, SP_SEMAPHORE
@@audio_0400150c:
    addi  $16, $zero, 0x0050
    addi  $15, $zero, adpcmTable
    ldv   $v25[0], 0x00($16)
    ldv   $v24[8], 0x00($16)
    ldv   $v23[0], 0x08($16)
    ldv   $v23[8], 0x08($16)
    lqv   $v27[0], 0x10($19)    // last 8 frames
    addi  $19, $19, 0x20
    beqz  $18, @@audio_040016e8
     ldv   $v1[0], 0x00($20)
    lbu   $1, 0x00($21)
    andi  $11, $1, 0x000f
    sll   $11, $11, 5
    vand  $v3, $v25, $v1[0]
    add   $13, $11, $15
    vand  $v4, $v24, $v1[1]
    srl   $14, $1, 4
    vand  $v5, $v25, $v1[2]
    addi  $2, $zero, 12
    vand  $v6, $v24, $v1[3]
    sub   $14, $2, $14
    addi  $2, $14, -1
    addi  $3, $zero, 1
    sll   $3, $3, 15
    srlv  $4, $3, $2
    mtc2  $4, $v22[0]
    lqv   $v21[0], 0x00($13)
    lqv   $v20[0], 0x10($13)
    addi  $13, $13, -2
    lrv   $v19[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v18[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v17[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v16[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v15[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v14[0], 0x20($13)
    addi  $13, $13, -2
    lrv   $v13[0], 0x20($13)
@@audio_040015b4:
    addi  $20, $20, 9
    vmudn $v30, $v3, $v23
    addi  $21, $21, 9
    vmadn $v30, $v4, $v23
    ldv   $v1[0], 0x00($20)
    vmudn $v29, $v5, $v23
    lbu   $1, 0x00($21)
    vmadn $v29, $v6, $v23
    blez  $14, @@audio_040015e4
     andi  $11, $1, 0x000f
    vmudm $v30, $v30, $v22[0]
    vmudm $v29, $v29, $v22[0]
@@audio_040015e4:
    sll   $11, $11, 5
    vand  $v3, $v25, $v1[0]
    add   $13, $11, $15
    vand  $v4, $v24, $v1[1]
    vand  $v5, $v25, $v1[2]
    vand  $v6, $v24, $v1[3]
    srl   $14, $1, 4
    vmudh $v2, $v21, $v27[6]
    addi  $2, $zero, 12
    vmadh $v2, $v20, $v27[7]
    sub   $14, $2, $14
    vmadh $v2, $v19, $v30[0]
    addi  $2, $14, -1
    vmadh $v2, $v18, $v30[1]
    addi  $3, $zero, 1
    vmadh $v2, $v17, $v30[2]
    sll   $3, $3, 15
    vmadh $v2, $v16, $v30[3]
    srlv  $4, $3, $2
    vmadh $v28, $v15, $v30[4]
    mtc2  $4, $v22[0]
    vmadh $v2, $v14, $v30[5]
    vmadh $v2, $v13, $v30[6]
    vmadh $v2, $v30, $v31[5]
    vsar  $v26, $v7, $v28[1]
    vsar  $v28, $v7, $v28[0]
    vmudn $v2, $v26, $v31[4]
    vmadh $v28, $v28, $v31[4]
    vmudh $v2, $v19, $v29[0]
    addi  $12, $13, -2
    vmadh $v2, $v18, $v29[1]
    lrv   $v19[0], 0x20($12)
    vmadh $v2, $v17, $v29[2]
    addi  $12, $12, -2
    vmadh $v2, $v16, $v29[3]
    lrv   $v18[0], 0x20($12)
    vmadh $v2, $v15, $v29[4]
    addi  $12, $12, -2
    vmadh $v2, $v14, $v29[5]
    lrv   $v17[0], 0x20($12)
    vmadh $v2, $v13, $v29[6]
    addi  $12, $12, -2
    vmadh $v2, $v29, $v31[5]
    lrv   $v16[0], 0x20($12)
    vmadh $v2, $v21, $v28[6]
    addi  $12, $12, -2
    vmadh $v2, $v20, $v28[7]
    lrv   $v15[0], 0x20($12)
    vsar  $v26, $v7, $v27[1]
    addi  $12, $12, -2
    vsar  $v27, $v7, $v27[0]
    lrv   $v14[0], 0x20($12)
    addi  $12, $12, -2
    lrv   $v13[0], 0x20($12)
    lqv   $v21[0], 0x00($13)
    vmudn $v2, $v26, $v31[4]
    lqv   $v20[0], 0x10($13)
    vmadh $v27, $v27, $v31[4]
    addi  $18, $18, -0x20
    sdv   $v28[0], 0x00($19)
    sdv   $v28[8], 0x08($19)
    sdv   $v27[0], 0x10($19)
    sdv   $v27[8], 0x18($19)
    bgtz  $18, @@audio_040015b4
     addi  $19, $19, 0x20
@@audio_040016e8:
    addi  $1, $19, -0x20
    addi  $2, $17, 0x00
    jal   dma_write_start
     addi  $3, $zero, 0x1f
@@dma_write_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_write_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_POLEF: // unused by SM64
@@dma_read_busy:
@@audio_040017a0:
@@audio_04001800:
@@dma_write_busy:
@@audio_04001874:

cmd_RESAMPLE:
    lh    $8, (audio_in_buf)($24)
    lh    $19, (audio_out_buf)($24)
    lh    $18, (audio_count)($24)
    sll   $v0, $t9, 8
    srl   $v0, $v0, 8
    addi  $1, $23, 0x0000
    sw    $2, 0x40($23)       // overwrite TASK_UCODE ptr
    addi  $3, $zero, 0x1f
    srl   $7, $26, 16
    andi  $10, $7, A_INIT
    bgtz  $10, @@audio_040018dc
     nop
    jal   dma_read_start
     nop
@@dma_read_busy:
    mfc0  $1, SP_DMA_BUSY
    bnez  $1, @@dma_read_busy
     nop
    j     @@audio_040018e8
     mtc0  $zero, SP_SEMAPHORE
@@audio_040018dc:
    sh    $zero, 0x08($23)
    vxor  $v16, $v16, $v16
    sdv   $v16[0], 0x00($23)
@@audio_040018e8:
    andi  $10, $7, 0x02      // A_LOOP? A_OUT?
    beqz  $10, @@audio_04001908
     ldv   $v16[0], 0x00($23)
    addi  $t0, $t0, -4
    ssv   $v16[0], 0x00($t0)
    ssv   $v16[4], 0x02($t0)
    j     @@audio_c410c
     nop

@@audio_04001908:
    andi  $t2, $a3, 4
    beqz  $t2, @@audio_c4104
     nop
    addi  $t0, $t0, -16
    ssv   $v16[0], 0x00($t0)
    ssv   $v16[0], 0x02($t0)
    ssv   $v16[2], 0x04($t0)
    ssv   $v16[2], 0x06($t0)
    ssv   $v16[4], 0x08($t0)
    ssv   $v16[4], 0x0a($t0)
    ssv   $v16[6], 0x0c($t0)
    ssv   $v16[6], 0x0e($t0)
    j     @@audio_c410c
     nop
@@audio_c4104:
    addi  $8, $8, -8
    sdv   $v16[0], 0x00($8)  
@@audio_c410c:
    lsv   $v23[14], 0x08($23)   // saved pitch_accumulator
    ldv   $v16[0], 0x00($8)  
    mtc2  $8, $v18[4]
    addi  $10, $zero, 0x100
    mtc2  $10, $v18[6]
    mtc2  $26, $v18[8]          // pitch
    addi  $10, $zero, 0x40
    mtc2  $10, $v18[10]
    addi  $9, $zero, 0x60
    lqv   $v31[0], 0x10($9)     // 0x50
    lqv   $v25[0], 0x00($9)     // 0x40
    vsub  $v25, $v25, $v31
    lqv   $v30[0], 0x20($9)     // 0x60
    lqv   $v29[0], 0x30($9)     // 0x70
    lqv   $v28[0], 0x40($9)     // 0x80
    lqv   $v27[0], 0x50($9)     // 0x90
    lqv   $v26[0], 0x60($9)     // 0xA0
    vsub  $v25, $v25, $v31
    lqv   $v24[0], 0x70($9)     // 0xB0
    addi  $21, $23, 0x20
    addi  $20, $23, 0x30
    vxor  $v22, $v22, $v22
    vmudm $v23, $v31, $v23[7]   // load pitch_accumulator into every vector element
    vmadm $v22, $v25, $v18[4]   // (accumulate with pitch times index) >> 16
    vmadn $v23, $v31, $v30[0]   // result & 0xffff
    vmudn $v21, $v31, $v18[2]   // load the in address into every vector element
    vmadn $v21, $v22, $v30[2]   // accumulate with 2 * $v22
    vmudl $v17, $v23, $v18[5]   // 64 * $v23 >> 16
    vmudn $v17, $v17, $v30[4]   // * 8
    vmadn $v17, $v31, $v18[3]   // += 0x00c0 (resample lookup table address)
    lqv   $v25[0], 0x00($9)
    sqv   $v21[0], 0x00($21)
    sqv   $v17[0], 0x00($20)
    ssv   $v23[7], 0x08($23)
    lh    $17, 0x00($21)
    lh    $9, 0x00($20)
    lh    $13, 0x08($21)
    lh    $5, 0x08($20)
    lh    $16, 0x02($21)
    lh    $8, 0x02($20)
    lh    $12, 0x0a($21)
    lh    $4, 0x0a($20)
    lh    $15, 0x04($21)
    lh    $7, 0x04($20)
    lh    $11, 0x0c($21)
    lh    $3, 0x0c($20)
    lh    $14, 0x06($21)
    lh    $6, 0x06($20)
    lh    $10, 0x0e($21)
    lh    $2, 0x0e($20)
@@audio_040019d8:
    ldv   $v16[0], 0x00($17)
    vmudm $v23, $v31, $v23[7]
    ldv   $v15[0], 0x00($9)
    vmadh $v23, $v31, $v22[7]
    ldv   $v16[8], 0x00($13)
    vmadm $v22, $v25, $v18[4]
    ldv   $v15[8], 0x00($5)
    vmadn $v23, $v31, $v30[0]
    ldv   $v14[0], 0x00($16)
    vmudn $v21, $v31, $v18[2]
    ldv   $v13[0], 0x00($8)
    vmadn $v21, $v22, $v30[2]
    ldv   $v14[8], 0x00($12)
    vmudl $v17, $v23, $v18[5]
    ldv   $v13[8], 0x00($4)
    ldv   $v12[0], 0x00($15)
    ldv   $v11[0], 0x00($7)
    ldv   $v12[8], 0x00($11)
    vmudn $v17, $v17, $v30[4]
    ldv   $v11[8], 0x00($3)
    ldv   $v10[0], 0x00($14)
    ldv   $v9[0], 0x00($6)
    vmadn $v17, $v31, $v18[3]
    ldv   $v10[8], 0x00($10)
    vmulf $v8, $v16, $v15
    ldv   $v9[8], 0x00($2)
    vmulf $v7, $v14, $v13
    sqv   $v21[0], 0x00($21)
    vmulf $v6, $v12, $v11
    sqv   $v17[0], 0x00($20)
    lh    $17, 0x00($21)
    vmulf $v5, $v10, $v9
    lh    $9, 0x00($20)
    vadd  $v8, $v8, $v8[1q]
    lh    $13, 0x08($21)
    vadd  $v7, $v7, $v7[1q]
    lh    $5, 0x08($20)
    vadd  $v6, $v6, $v6[1q]
    lh    $16, 0x02($21)
    vadd  $v5, $v5, $v5[1q]
    lh    $8, 0x02($20)
    vadd  $v8, $v8, $v8[2h]
    lh    $12, 0x0a($21)
    vadd  $v7, $v7, $v7[2h]
    lh    $4, 0x0a($20)
    vadd  $v6, $v6, $v6[2h]
    lh    $15, 0x04($21)
    vadd  $v5, $v5, $v5[2h]
    lh    $7, 0x04($20)
    vmudn $v4, $v29, $v8[0h]
    lh    $11, 0x0c($21)
    vmadn $v4, $v28, $v7[0h]
    lh    $3, 0x0c($20)
    vmadn $v4, $v27, $v6[0h]
    lh    $14, 0x06($21)
    vmadn $v4, $v26, $v5[0h]
    lh    $6, 0x06($20)
    lh    $10, 0x0e($21)
    addi  $18, $18, -0x10
    sqv   $v4[0], 0x00($19)
    blez  $18, @@audio_04001ad8
     lh    $2, 0x0e($20)
    j     @@audio_040019d8
     addi  $19, $19, 0x0010
@@audio_04001ad8:
    ssv   $v23[0], 0x08($23)
    ldv   $v16[0], 0x00($17)
    sdv   $v16[0], 0x00($23)
    lw    $2, 0x40($23)
    addi  $1, $23, 0x00
    jal   dma_write_start
     addi  $3, $zero, 0x1f
@@dma_write_busy:
    mfc0  $5, SP_DMA_BUSY
    bnez  $5, @@dma_write_busy
     nop
    j     cmd_SPNOOP
     mtc0  $zero, SP_SEMAPHORE

cmd_17e4:
    srl   $t7, $k0, 16 
    andi  $t7, $t7, 0xff
    andi  $t5, $k0, 0xffff
    srl   $t6, $t9, 0x10
@@audio_30C314:
    addi  $t7, $t7, -1
    andi  $t4, $t9, 0xffff
@@audio_30C31C:
    lqv   $v1[0], 0x00($t5)
    lqv   $v2[0], 0x10($t5)
    addi  $t4, $t4, -0x20
    addi  $t5, $t5, 0x20
    sqv   $v1[0], 0x00($t6)
    sqv   $v2[0], 0x10($t6)
    bgtz  $t4, @@audio_30C31C
     addi  $t6, $t6, 0x20
    bgtz  $t7, @@audio_30C314
     nop
    j cmd_SPNOOP
     nop

cmd_DUPLICATE:
    srl   $t7, $k0, 0x10
    andi  $t7, $t7, 0xff
    andi  $t5, $k0, 0xffff
    srl   $t6, $t9, 0x10
    lqv   $v1[0], 0x00($t5)
    lqv   $v2[0], 0x10($t5)
    lqv   $v3[0], 0x20($t5)
    lqv   $v4[0], 0x30($t5)
    lqv   $v5[0], 0x40($t5)
    lqv   $v6[0], 0x50($t5)
    lqv   $v7[0], 0x60($t5)
    lqv   $v8[0], 0x70($t5)
@@audio_30C37C:
    addi  $t7, $t7, -1
    sqv   $v1[0], 0x00($t6)
    sqv   $v2[0], 0x10($t6)
    sqv   $v3[0], 0x20($t6)
    sqv   $v4[0], 0x30($t6)
    sqv   $v5[0], 0x40($t6)
    sqv   $v6[0], 0x50($t6)
    sqv   $v7[0], 0x60($t6)
    sqv   $v8[0], 0x70($t6)
    bgtz  $t7, @@audio_30C37C
     addi $t6, $t6, 0x80
    j cmd_SPNOOP
     nop

cmd_INTERL:
    andi  $t4, $k0, 0xffff
    andi  $t6, $t9, 0xffff
    srl   $t5, $t9, 0x10
@@audio_30C3BC:
    lsv   $v1[0], 0x00($t5)
    lsv   $v2[0], 0x08($t5)
    lsv   $v3[0], 0x10($t5)
    lsv   $v4[0], 0x18($t5)
    lsv   $v1[2], 0x04($t5)
    lsv   $v2[2], 0x0c($t5)
    lsv   $v3[2], 0x14($t5)
    lsv   $v4[2], 0x1c($t5)
    addi  $t5, $t5, 0x20
    slv   $v1[0], 0x00($t6)
    slv   $v2[0], 0x04($t6)
    slv   $v3[0], 0x08($t6)
    addi  $t4, $t4, -8
    slv   $v4[0], 0x0c($t6)
    bgtz  $t4, @@audio_30C3BC
     addi $t6, $t6, 0x10
    j cmd_SPNOOP
     nop

cmd_ENVMIXER:
    vxor  $v4, $v4, $v4
    vxor  $v0, $v0, $v0
    lqv   $v3[0], 0x0(r0)
    add   $21, $21, $21
    mtc2  $21, $v4[0]
    mtc2  $21, $v4[2]
    srl   $12, $26, 12
    andi  $19, $12, 0xff0
    add   $22, $22, $22
    mtc2  $22, $v4[4]
    mtc2  $22, $v4[6]
    srl   $12, $25, 20
    andi  $14, $12, 0xff0
    add   $11, $11, $11
    mtc2  $11, $v4[8]
    mtc2  $11, $v4[10]
    srl   $12, $25, 12
    andi  $15, $12, 0xff0
    srl   $12, $25, 4
    andi  $16, $12, 0xff0
    sll   $12, $25, 4
    andi  $17, $12, 0xff0
    andi  $12, $26, 0x2
    lhu   $12, 0xe0(r12)
    mtc2  $12, $v2[0]
    andi  $12, $26, 0x1
    sll   $12, $12, 1
    lhu   $12, 0xe0(r12)
    mtc2  $12, $v2[2]
    srl   $12, $26, 8
    andi  $20, $12, 0xff
    vadd  $v0, $v0, $v0
    andi  $10, $26, 0x4
    lqv   $v8[0], 0x0(r19)

@audio_400196c:
    lqv   $v15[0], 0x10(r19)
    addi  $19, $19, 0x20
    vmudm $v9, $v8, $v1[0]
    vmudm $v10, $v8, $v1[2]
    addi  $20, $20, 0xfff0
    lqv   $v11[0], 0x0(r14)
    lqv   $v12[0], 0x0(r15)
    vmudm $v16, $v15, $v1[1]
    vmudm $v17, $v15, $v1[3]
    lqv   $v18[0], 0x10(r14)
    lqv   $v19[0], 0x10(r15)
    vxor  $v9, $v9, $v2[0]
    vxor  $v10, $v10, $v2[1]
    lqv   $v13[0], 0x0(r16)
    lqv   $v14[0], 0x0(r17)
    vadd  $v11, $v11, $v9
    vadd  $v12, $v12, $v10
    vmudm $v9, $v9, $v1[4]
    vmudm $v10, $v10, $v1[4]
    vxor  $v16, $v16, $v2[0]
    vxor  $v17, $v17, $v2[1]
    lqv   $v20[0], 0x10(r16)
    lqv   $v21[0], 0x10(r17)
    vadd  $v18, $v18, $v16
    vadd  $v19, $v19, $v17
    vmudm $v16, $v16, $v1[5]
    vmudm $v17, $v17, $v1[5]
    sqv   $v11[0], 0x0(r14)
    bne   $10, $0, @audio_4001a34
    sqv   $v12[0], 0x0(r15)
    vadd  $v13, $v13, $v9
    vadd  $v14, $v14, $v10
    sqv   $v18[0], 0x10(r14)
    sqv   $v19[0], 0x10(r15)
    vadd  $v20, $v20, $v16
    vadd  $v21, $v21, $v17
@audio_40019fc:
    addi  $14, $14, 0x20
    sqv   $v13[0], 0x0(r16)
    sqv   $v14[0], 0x0(r17)
    addi  $15, $15, 0x20
    lqv   $v8[0], 0x0(r19)
    sqv   $v20[0], 0x10(r16)
    sqv   $v21[0], 0x10(r17)
    addi  $16, $16, 0x20
    vaddc $v1, $v1, $v4
    addi  $17, $17, 0x20
    bgtz  $20, @audio_400196c
    vadd  $v0, $v0, $v0
    j     cmd_SPNOOP
     vxor $v0, $v0, $v0
@audio_4001a34:
    vadd  $v13, $v13, $v10
    vadd  $v14, $v14, $v9
    sqv   $v18[0], 0x10(r14)
    sqv   $v19[0], 0x10(r15)
    vadd  $v20, $v20, $v17
    j     @audio_40019fc
     vadd $v21, $v21, $v16

cmd_ENVSETUP1:
    vxor  $v1, $v1, $v1
    andi  $11, $26, 0xffff
    srl   $12, $26, 8
    andi  $12, $12, 0xff00
    mtc2  $12, $v1[8]
    add   $12, $12, $11
    mtc2  $12, $v1[10]
    srl   $21, $25, 16
    j     cmd_SPNOOP
     andi $22, $25, 0xffff

cmd_ENVSETUP2:
    srl   $12, $25, 16
    mtc2  $12, $v1[0]
    add   $12, $12, $21
    mtc2  $12, $v1[2]
    andi  $12, $25, 0xffff
    mtc2  $12, $v1[4]
    add   $12, $12, $22
    j     cmd_SPNOOP
     mtc2  $12, $v1[6]

@audio_4001a9c:
    srl   $3, $26, 12
    andi  $3, $3, 0xff0
    andi  $1, $26, 0xffff
@audio_4001aa8:
    sll   $2, $25, 8
    jr    $31
     srl  $2, $2, 8

cmd_LOADBUFF:
    jal   @audio_4001a9c
     nop
    jal   dma_read_start
     addi $3, $3, 0xffff
@audio_4001ac4:
    mfc0  $1, sp_dma_busy
    bne   $1, $0, @audio_4001ac4
     nop
    j     cmd_SPNOOP
     mtc0 $0, sp_semaphore

cmd_SAVEBUFF:
    jal   @audio_4001a9c
     nop
    jal   dma_write_start
     addi $3, $3, 0xffff
    j     @audio_4001ac4
     nop

cmd_LOADADPCM:
    jal   @audio_4001aa8
     addi $1, $0, adpcmTable
    andi  $3, $26, 0xffff
    jal   dma_read_start
     addi $3, $3, 0xffff
    j     @audio_4001ac4
     nop

cmd_MIXER:
    lqv   $v31[0], 0x0(r0)
    srl   $18, $26, 12
    andi  $18, $18, 0xff0
    andi  $19, $25, 0xffff
    srl   $20, $25, 16
    andi  $17, $26, 0xffff
    mtc2  $17, $v30[0]
    lqv   $v27[0], 0x0(r19)
    lqv   $v29[0], 0x0(r20)
    lqv   $v26[0], 0x10(r19)
    lqv   $v28[0], 0x10(r20)
@audio_4001b38:
    vmulf $v27, $v27, $v31[6]
    addi  $18, $18, 0xffe0
    vmacf $v27, $v29, $v30[0]
    addi  $20, $20, 0x20
    vmulf $v26, $v26, $v31[6]
    vmacf $v26, $v28, $v30[0]
    lqv   $v29[0], 0x0(r20)
    sqv   $v27[0], 0x0(r19)
    lqv   $v27[0], 0x20(r19)
    lqv   $v28[0], 0x10(r20)
    sqv   $v26[0], 0x10(r19)
    addi  $19, $19, 0x20
    bgtz  $18, @audio_4001b38
     lqv  $v26[0], 0x10(r19)
    j cmd_SPNOOP
     nop

cmd_1b78:
    lhu   $13, 0x0(r24)
    vxor  $v2, $v2, $v2
    lhu   $14, 0x2(r24)
    vxor  $v3, $v3, $v3
    lhu   $12, 0x4(r24)
    sll   $17, $25, 8
    srl   $17, $17, 8
    sqv   $v2[0], 0x0(r14)
    sqv   $v3[0], 0x10(r14)
    srl   $1, $26, 16
    andi  $1, $1, 0x1
    bgtz  $1, @audio_4001bd8
     srl  $1, $26, 16
    andi  $1, $1, 0x2
    beq   $0, $1, @audio_4001bbc
     addi $2, $17, 0x0
    lw    $2, 0x10(r24)
@audio_4001bbc:
    addi  $1, $14, 0x0
    jal   dma_read_start
     addi $3, $0, 0x1f
@audio_4001bc8:
    mfc0  $5, sp_dma_busy
    bne   $5, $0, @audio_4001bc8
     nop
    mtc0  $0, sp_semaphore
@audio_4001bd8:
    addi  $14, $14, 0x20
    beq   $12, $0, @audio_4001c04
     nop
@audio_4001be4:
    lpv   $v2[0], 0x0(r13)
    lpv   $v3[0], 0x8(r13)
    addi  $13, $13, 0x10
    addi  $12, $12, 0xffe0
    sqv   $v2[0], 0x0(r14)
    sqv   $v3[0], 0x10(r14)
    bgtz  $12, @audio_4001be4
     addi $14, $14, 0x20
@audio_4001c04:
    addi  $1, $14, 0xffe0
    addi  $2, $17, 0x0
    jal   dma_write_start
     addi  $3, $0, 0x1f
@audio_4001c14:
    mfc0  $5, sp_dma_busy
    bne   $5, $0, @audio_4001c14
     nop
    j     cmd_SPNOOP
     mtc0 $0, sp_semaphore

cmd_HILOGAIN:
    andi  $12, $26, 0xffff
    srl   $13, $25, 16
    srl   $15, $26, 4
    andi  $15, $15, 0xf000
    mtc2  $15, $v3[2]
    srl   $15, $26, 20
    andi  $15, $15, 0xf
    mtc2  $15, $v3[0]
@audio_4001c48:
    lqv   $v1[0], 0x0(r13)
    lqv   $v2[0], 0x10(r13)
    vmudm $v4, $v1, $v3[1]
    vmadh $v4, $v1, $v3[0]
    vmudm $v5, $v2, $v3[1]
    vmadh $v5, $v2, $v3[0]
    sqv   $v4[0], 0x0(r13)
    sqv   $v5[0], 0x10(r13)
    addi  $12, $12, 0xffe0
    bgtz  $12, @audio_4001c48
    addi  $13, $13, 0x20
    j     cmd_SPNOOP
     vxor $v0, $v0, $v0

cmd_1c7c:
    andi  $12, $26, 0xffff
    srl   $13, $25, 16
    addi  $14, $13, 0x0
    andi  $15, $25, 0xffff
    srl   $11, $26, 16
    andi  $11, $11, 0xff
    add   $15, $15, $11
    ldv   $v11[0], 0x0(r15)
    ldv   $v12[0], 0x10(r15)
    ldv   $v13[0], 0x20(r15)
    ldv   $v14[0], 0x30(r15)
    ldv   $v11[8], 0x8(r15)
    ldv   $v12[8], 0x18(r15)
    ldv   $v13[8], 0x28(r15)
    ldv   $v14[8], 0x38(r15)
@audio_4001cb8:
    lqv   $v3[0], 0x0(r13)
    lqv   $v4[0], 0x10(r13)
    lqv   $v5[0], 0x20(r13)
    lqv   $v6[0], 0x30(r13)
    vmudh $v3, $v3, $v11
    vmudh $v4, $v4, $v12
    vmudh $v5, $v5, $v13
    vmudh $v6, $v6, $v14
    sqv   $v3[0], 0x0(r13)
    sqv   $v4[0], 0x10(r13)
    sqv   $v5[0], 0x20(r13)
    sqv   $v6[0], 0x30(r13)
    addi  $12, $12, 0xffc0
    bgtz  $12, @audio_4001cb8
     addi  $13, $13, 0x40
    j     cmd_SPNOOP
     nop

cmd_FILTER:
    addi  $13, $23, 0x0
    vxor  $v0, $v0, $v0
    addi  $14, $23, 0x10
    sqv   $v0[0], 0x0(r13)
    sll   $2, $25, 8
    srl   $2, $2, 8
    srl   $12, $26, 16
    andi  $12, $12, 0xff
    beq   $12, $0, @audio_4001d68
     nop
    addi  $12, $12, 0xffff
    beq   $12, $0, @audio_4001d88
     nop
    andi  $15, $26, 0xffff
    vxor  $v0, $v0, $v0
    sqv   $v0[0], 0x0(r14)
    sqv   $v0[0], 0x20(r14)
    addi  $1, $14, 0x10
    addi  $3, $0, 0xf
    jal   dma_read_start
     nop
    mfc0  $5, sp_dma_busy
    bne   $5, $0, 0x4001d50
    nop
    mtc0  $0, sp_semaphore
    j     cmd_SPNOOP
     nop
@audio_4001d68:
    add   $1, $13, $0
    addi  $3, $0, 0xf
    jal   dma_read_start
    nop
@audio_4001d78:
    mfc0  $5, sp_dma_busy
    bne   $5, $0, 0x4001d78
     nop
    mtc0  $0, sp_semaphore
@audio_4001d88:
    add   $1, $13, $0
    andi  $11, $26, 0xffff
    lqv   $v24[0], 0x10(r14)
    ldv   $v28[0], 0x8(r14)
    ldv   $v28[8], 0x10(r14)
    ldv   $v20[0], 0x18(r14)
    ldv   $v20[8], 0x20(r14)
    addi  $14, $14, 0x2
    ldv   $v31[0], 0x0(r14)
    ldv   $v31[8], 0x8(r14)
    ldv   $v17[0], 0x10(r14)
    ldv   $v17[8], 0x18(r14)
    ldv   $v27[0], 0x8(r14)
    ldv   $v27[8], 0x10(r14)
    ldv   $v21[0], 0x18(r14)
    ldv   $v21[8], 0x20(r14)
    addi  $14, $14, 0x2
    ldv   $v30[0], 0x0(r14)
    ldv   $v30[8], 0x8(r14)
    ldv   $v26[0], 0x8(r14)
    ldv   $v26[8], 0x10(r14)
    ldv   $v18[0], 0x10(r14)
    ldv   $v18[8], 0x18(r14)
    ldv   $v22[0], 0x18(r14)
    ldv   $v22[8], 0x20(r14)
    addi  $14, $14, 0x2
    ldv   $v29[0], 0x0(r14)
    ldv   $v29[8], 0x8(r14)
    ldv   $v25[0], 0x8(r14)
    ldv   $v25[8], 0x10(r14)
    ldv   $v19[0], 0x10(r14)
    ldv   $v19[8], 0x18(r14)
    ldv   $v23[0], 0x18(r14)
    ldv   $v23[8], 0x20(r14)
    lqv   $v15[0], 0x0(r13)
@audio_4001e14:
    lqv   $v16[0], 0x0(r11)
    vxor  $v14, $v14, $v14
    vmulf $v0, $v0, $v0
    vmacf $v14, $v23, $v15[1]
    vmacf $v14, $v22, $v15[2]
    vmacf $v14, $v21, $v15[3]
    vmacf $v14, $v20, $v15[4]
    vmacf $v14, $v19, $v15[5]
    vmacf $v14, $v18, $v15[6]
    vmacf $v14, $v17, $v15[7]
    vmacf $v14, $v24, $v16[0]
    vmacf $v14, $v25, $v16[1]
    vmacf $v14, $v26, $v16[2]
    vmacf $v14, $v27, $v16[3]
    vmacf $v14, $v28, $v16[4]
    vmacf $v14, $v29, $v16[5]
    vmacf $v14, $v30, $v16[6]
    vmacf $v14, $v31, $v16[7]
    addi  $15, $15, 0xfff0
    sqv   $v14[0], 0x0(r11)
    addi  $11, $11, 0x10
    bgtz  $15, @audio_4001e14
     vaddc $v15, $v0, $v16
    sqv   $v16[0], 0x0(r13)
    addi  $3, $0, 0xf
    jal   dma_write_start
     nop
@audio_4001e80:
    mfc0 $5, sp_dma_busy
    bne  $5, $0, @audio_4001e80
    nop
    mtc0 $0, sp_semaphore
    j    cmd_SPNOOP
     nop

cmd_ADDMIXER:
    vaddc $v31, $v31, $v31
    srl   $18, $26, 12
    andi  $18, $18, 0xff0
    andi  $19, $25, 0xffff
    srl   $20, $25, 16
    lqv   $v27[0], 0x0(r19)
@audio_4001eb0:
    lqv   $v29[0], 0x0(r20)
    lqv   $v26[0], 0x10(r19)
    lqv   $v28[0], 0x10(r20)
    lqv   $v25[0], 0x20(r19)
    lqv   $v23[0], 0x20(r20)
    lqv   $v24[0], 0x30(r19)
    lqv   $v22[0], 0x30(r20)
    addi  $20, $20, 0x40
    vadd  $v27, $v27, $v29
    vadd  $v26, $v26, $v28
    vadd  $v25, $v25, $v23
    vadd  $v24, $v24, $v22
    addi  $18, $18, 0xffc0
    sqv   $v27[0], 0x0(r19)
    sqv   $v26[0], 0x10(r19)
    sqv   $v25[0], 0x20(r19)
    sqv   $v24[0], 0x30(r19)
    addi  $19, $19, 0x40
    bgtz  $18, @audio_4001eb0
     lqv  $v27[0], 0x0(r19)
    j     cmd_SPNOOP
     nop

cmd_RESAMPLE_ZOH:
    lh    $14, 0x0(r24)
    lh    $15, 0x2(r24)
    lh    $13, 0x4(r24)
    andi  $12, $26, 0xffff
    sll   $12, $12, 2
    andi  $10, $25, 0xffff
    sll   $14, $14, 16
    or    $10, $10, $14
@audio_4001f28:
    srl   $11, $10, 16
    andi  $11, $11, 0xfffe
    lsv   $v1[0], 0x0(r11)
    add   $10, $10, $12
    srl   $11, $10, 16
    andi  $11, $11, 0xfffe
    lsv   $v1[2], 0x0(r11)
    add   $10, $10, $12
    srl   $11, $10, 16
    andi  $11, $11, 0xfffe
    lsv   $v1[4], 0x0(r11)
    add   $10, $10, $12
    srl   $11, $10, 16
    andi  $11, $11, 0xfffe
    lsv   $v1[6], 0x0(r11)
    add   $10, $10, $12
    addi  $13, $13, 0xfff8
    sdv   $v1[0], 0x0(r15)
    addi  $15, $15, 0x8
    bgtz  $13, @audio_4001f28
     nop
    jal   cmd_SPNOOP
     nop

.close // CODE_FILE
