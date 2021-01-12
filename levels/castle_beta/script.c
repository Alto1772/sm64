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

    LOAD_MIO0(/*seg*/ 0x07, _castle_beta_segment_7SegmentRomStart, _castle_beta_segment_7SegmentRomEnd),

#ifdef REPLICATE_LEVEL
    // this has no use because there were no objects added in this level
    // (hangs on the emulator...)
    LOAD_MIO0(/*seg*/ 0x05, _group4_mio0SegmentRomStart,  _group4_mio0SegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x0C, _group4_geoSegmentRomStart,   _group4_geoSegmentRomEnd),
    LOAD_MIO0(/*seg*/ 0x06, _group13_mio0SegmentRomStart, _group13_mio0SegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x0D, _group13_geoSegmentRomStart,  _group13_geoSegmentRomEnd),
#endif

    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario),

#ifdef REPLICATE_LEVEL
    // ...and this also
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_2),
    JUMP_LINK(script_func_global_16),
#endif

    AREA(/*index*/ 1, geo_castle_beta),
#ifdef REPLICATE_LEVEL
        // there were no warp objects in this level script
        WARP_NODE(/*id*/ 0x01, /*destLevel*/ LEVEL_UNKNOWN_1, /*destArea*/ 0x02, /*destNode*/ 0x02, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ 0x02, /*destLevel*/ LEVEL_UNKNOWN_1, /*destArea*/ 0x01, /*destNode*/ 0x03, /*flags*/ WARP_NO_CHECKPOINT),
        WARP_NODE(/*id*/ 0x03, /*destLevel*/ LEVEL_UNKNOWN_1, /*destArea*/ 0x02, /*destNode*/ 0x01, /*flags*/ WARP_NO_CHECKPOINT),
#endif

        TERRAIN(/*terrainData*/ castle_beta_collision_level),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 0, /*pos*/ 0, 1024, 0),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
