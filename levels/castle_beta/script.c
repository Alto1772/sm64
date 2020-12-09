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
#include "levels/castle_beta/header.h"

const LevelScript level_castle_beta_entry[] = {
    INIT_LEVEL(),

    LOAD_MIO0(0x07, _castle_beta_segment_7SegmentRomStart, _castle_beta_segment_7SegmentRomEnd),

#ifdef REPLICATE_LEVEL
    // this has no use because there is no objects added in this level
    LOAD_MIO0(0x05, _group4_mio0SegmentRomStart,  _group4_mio0SegmentRomEnd),
    LOAD_RAW(0x0C, _group4_geoSegmentRomStart,   _group4_geoSegmentRomEnd),
    LOAD_MIO0(0x06, _group13_mio0SegmentRomStart, _group13_mio0SegmentRomEnd),
    LOAD_RAW(0x0D, _group13_geoSegmentRomStart,  _group13_geoSegmentRomEnd),
#endif

    ALLOC_LEVEL_POOL(),
    MARIO(MODEL_MARIO, 0x00000001, bhvMario),

#ifdef REPLICATE_LEVEL
    // ...and this also
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_2),
    JUMP_LINK(script_func_global_16),
#endif

    AREA(1, geo_castle_beta),
#ifdef REPLICATE_LEVEL
        // there were no warp objects in this level script
        WARP_NODE(0x01, LEVEL_UNKNOWN_1, 0x02, 0x02, WARP_NO_CHECKPOINT),
        WARP_NODE(0x02, LEVEL_UNKNOWN_1, 0x01, 0x03, WARP_NO_CHECKPOINT),
        WARP_NODE(0x03, LEVEL_UNKNOWN_1, 0x02, 0x01, WARP_NO_CHECKPOINT),
#endif

        TERRAIN(castle_beta_collision_level),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(1, 0, 0,1024,0),
    CALL(0, lvl_init_or_update),
    CALL_LOOP(1, lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(1),
    EXIT(),
};
