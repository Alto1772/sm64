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
#include "levels/sand_test/header.h"

const LevelScript level_sand_test_entry[] = {
    INIT_LEVEL(),

    LOAD_MIO0(0x07, _sand_test_segment_7SegmentRomStart, _sand_test_segment_7SegmentRomEnd),

    ALLOC_LEVEL_POOL(),
    MARIO(MODEL_MARIO, 0x00000001, bhvMario),

    AREA(1, geo_sand_test),
        OBJECT(MODEL_YELLOW_COIN, 836,0, 1306, 0,90,0, 0x0A0A0000, bhvFadingWarp),
        OBJECT(MODEL_YELLOW_COIN, 836,0,-1335, 0,90,0, 0x0A140000, bhvFadingWarp),
        WARP_NODE(0x0A, LEVEL_UNKNOWN_38, 0x01, 0x14, WARP_NO_CHECKPOINT),
        WARP_NODE(0x14, LEVEL_UNKNOWN_38, 0x01, 0x0A, WARP_NO_CHECKPOINT),

        TERRAIN(sand_test_seg7_sandtest_collision),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(1, 0, 0,0,1000),
    CALL(0, lvl_init_or_update),
    CALL_LOOP(1, lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(1),
    EXIT(),
};
