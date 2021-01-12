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
#include "levels/donjon/header.h"

const LevelScript level_donjon_entry[] = {
    INIT_LEVEL(),

    LOAD_MIO0(/*seg*/ 0x07, _donjon_segment_7SegmentRomStart, _donjon_segment_7SegmentRomEnd),

#ifdef REPLICATE_LEVEL
    // this has no use because there were no objects added in this level
    // (hangs on the emulator...)
    LOAD_MIO0(/*seg*/ 0x05, _group4_mio0SegmentRomStart, _group4_mio0SegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x0C, _group4_geoSegmentRomStart, _group4_geoSegmentRomEnd),
    LOAD_MIO0(/*seg*/ 0x06, _group13_mio0SegmentRomStart, _group13_mio0SegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x0D, _group13_geoSegmentRomStart, _group13_geoSegmentRomEnd),
    LOAD_MIO0(/*seg*/ 0x08, _common0_mio0SegmentRomStart, _common0_mio0SegmentRomEnd),
    LOAD_RAW( /*seg*/ 0x0F, _common0_geoSegmentRomStart, _common0_geoSegmentRomEnd),
#endif

    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario),

#ifdef REPLICATE_LEVEL
    JUMP_LINK(script_func_global_1),
    JUMP_LINK(script_func_global_2),
    JUMP_LINK(script_func_global_16),
#endif

    AREA(/*index*/ 1, geo_donjon),
        TERRAIN(/*terrainData*/ donjon_collision_level),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 180, /*pos*/ 500, 2000, 0),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
