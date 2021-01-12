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
#include "levels/athlmap/header.h"

const LevelScript level_athlmap_entry[] = {
    INIT_LEVEL(),

    LOAD_MIO0(/*seg*/ 0x07, _athlmap_segment_7SegmentRomStart, _athlmap_segment_7SegmentRomEnd),

    ALLOC_LEVEL_POOL(),
    MARIO(/*model*/ MODEL_MARIO, /*behParam*/ 0x00000001, /*beh*/ bhvMario),

    AREA(/*index*/ 1, geo_athlmap),
        TERRAIN(/*terrainData*/ athlmap_collision_level),
    END_AREA(),

    FREE_LEVEL_POOL(),
    MARIO_POS(/*area*/ 1, /*yaw*/ 0, /*pos*/ 1000, 5000, 1000),
    CALL(/*arg*/ 0, /*func*/ lvl_init_or_update),
    CALL_LOOP(/*arg*/ 1, /*func*/ lvl_init_or_update),
    CLEAR_LEVEL(),
    SLEEP_BEFORE_EXIT(/*frames*/ 1),
    EXIT(),
};
