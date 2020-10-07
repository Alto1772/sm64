#ifndef BTCSTL_HEADER_H
#define BTCSTL_HEADER_H

#include "types.h"
#include "game/moving_texture.h"

// geo
extern const GeoLayout geo_betacastle[];

// leveldata
extern const Collision betacastle_seg7_collision_level[];
extern const Gfx betacastle_seg7_dl[];
extern const struct MovtexQuadCollection betacastle_movtex_ground[]; // **unused unused water render**

// script
extern const LevelScript level_betacastle_entry[];

#endif
