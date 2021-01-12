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

    LOAD_MIO0(/*seg*/ 0x07, _sand_test_segment_7SegmentRomStart, _sand_test_segment_7SegmentRomEnd),

    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario),

    AREA(/*index*/ 1, geo_sand_test),
        OBJECT(/*model*/ MODEL_YELLOW_COIN, /*pos*/ 836, 0,  1306, /*angle*/ 0, 90, 0, /*behParam*/ 0x0A0A0000, /*beh*/ bhvFadingWarp),
        OBJECT(/*model*/ MODEL_YELLOW_COIN, /*pos*/ 836, 0, -1335, /*angle*/ 0, 90, 0, /*behParam*/ 0x0A140000, /*beh*/ bhvFadingWarp),
        WARP_NODE(/*id*/ 0x0A, /*destLevel*/ LEVEL_UNKNOWN_38, /*destArea*/ 0x01, /*destNode*/ 0x14, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ 0x14, /*destLevel*/ LEVEL_UNKNOWN_38, /*destArea*/ 0x01, /*destNode*/ 0x0A, /*flags*/ WARP_NO_CHECKPOINT),
        TERRAIN(/*terrainData*/ sand_test_seg7_sandtest_collision),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 0, /*pos*/ 0, 0, 1000),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
