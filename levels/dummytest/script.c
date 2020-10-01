#include <ultra64.h>
#include "sm64.h"
#include "behavior_data.h"
#include "model_ids.h"
#include "seq_ids.h"
#include "dialog_ids.h"
#include "segment_symbols.h"
#include "level_commands.h"

#include "game/level_update.h"

#include "levels/scripts.h"

#include "make_const_nonconst.h"
#include "levels/dummytest/header.h"

const LevelScript level_dummytest_entry[] = {
    INIT_LEVEL(),

    LOAD_MIO0(0x07, _dummytest_segment_7SegmentRomStart, _dummytest_segment_7SegmentRomEnd),

    ALLOC_LEVEL_POOL(),
    MARIO(MODEL_MARIO, 0x00000001, bhvMario),

    AREA(1,dummytest_geo),
        TERRAIN(dummytest_seg7_collision),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(1, 0, 0,0,0),
    CALL(0, lvl_init_or_update),
    CALL_LOOP(1, lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(1),
    EXIT(),
};
