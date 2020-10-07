/*
 * NOTE: This goes unused... not even in the source code headers.
 *
 * pls add details here
 */

static Movtex betacastle_movtex_ground_data[] = {
    MOV_TEX_INIT_LOAD(2),
    MOV_TEX_ROT_SPEED(32),
    MOV_TEX_ROT_SCALE(25),
    MOV_TEX_4_BOX_TRIS(-3584, -3584),
    MOV_TEX_4_BOX_TRIS(-3584,  3584),
    MOV_TEX_4_BOX_TRIS( 3800,  3584),
    MOV_TEX_4_BOX_TRIS( 3800, -3584),
    MOV_TEX_ROT(ROTATE_CLOCKWISE),
    MOV_TEX_ALPHA(0xA0),
    MOV_TEX_DEFINE(TEXTURE_WATER),
    MOV_TEX_END(),
    MOV_TEX_ROT_SPEED(32),
    MOV_TEX_ROT_SCALE(5),
    MOV_TEX_4_BOX_TRIS( 3072,  3072),
    MOV_TEX_4_BOX_TRIS( 3072,  6144),
    MOV_TEX_4_BOX_TRIS( 6144,  6144),
    MOV_TEX_4_BOX_TRIS( 6144,  3072),
    MOV_TEX_ROT(ROTATE_CLOCKWISE),
    MOV_TEX_ALPHA(0xA0),
    MOV_TEX_DEFINE(TEXTURE_WATER),
    MOV_TEX_END(),
};

const struct MovtexQuadCollection betacastle_movtex_ground[] = {
    {0, betacastle_movtex_ground_data},
    {-1, NULL},
};
