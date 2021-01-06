// this goes unused... so this will not reference to headers.h

static const Lights1 castle_beta_bartest_lights = gdSPDefLights1(
    0x00, 0x3f, 0x3f,
    0x00, 0xff, 0xff, 0x28, 0x28, 0x28
);
 
static const Vtx castle_beta_bartest_vertex_000[] = {
    {{{     0,   1500,      9}, 0, {     0,      0}, {0x00, 0x7f, 0x00, 0x00}}},
    {{{    10,   1500,     -9}, 0, {     0,      0}, {0x00, 0x7f, 0x00, 0x00}}},
    {{{   -10,   1500,     -9}, 0, {     0,      0}, {0x00, 0x7f, 0x00, 0x00}}},
    {{{    10,      0,     -9}, 0, {     0,      0}, {0x00, 0x81, 0x00, 0x00}}},
    {{{     0,      0,      9}, 0, {     0,      0}, {0x00, 0x81, 0x00, 0x00}}},
    {{{   -10,      0,     -9}, 0, {     0,      0}, {0x00, 0x81, 0x00, 0x00}}},
    {{{    10,   1500,     -9}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0x00}}},
    {{{   -10,      0,     -9}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0x00}}},
    {{{   -10,   1500,     -9}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0x00}}},
    {{{    10,      0,     -9}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0x00}}},
    {{{   -10,      0,     -9}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0x00}}},
    {{{    10,   1500,     -9}, 0, {     0,      0}, {0x00, 0x00, 0x81, 0x00}}},
    {{{     0,   1500,      9}, 0, {     0,      0}, {0x6f, 0x00, 0x3d, 0x00}}},
    {{{    10,      0,     -9}, 0, {     0,      0}, {0x6f, 0x00, 0x3d, 0x00}}},
    {{{    10,   1500,     -9}, 0, {     0,      0}, {0x6f, 0x00, 0x3d, 0x00}}},
};

static const Vtx castle_beta_bartest_vertex_001[] = {
    {{{     0,      0,      9}, 0, {     0,      0}, {0x6f, 0x00, 0x3d, 0x00}}},
    {{{    10,      0,     -9}, 0, {     0,      0}, {0x6f, 0x00, 0x3d, 0x00}}},
    {{{     0,   1500,      9}, 0, {     0,      0}, {0x6f, 0x00, 0x3d, 0x00}}},
    {{{   -10,   1500,     -9}, 0, {     0,      0}, {0x91, 0x00, 0x3d, 0x00}}},
    {{{     0,      0,      9}, 0, {     0,      0}, {0x91, 0x00, 0x3d, 0x00}}},
    {{{     0,   1500,      9}, 0, {     0,      0}, {0x91, 0x00, 0x3d, 0x00}}},
    {{{   -10,      0,     -9}, 0, {     0,      0}, {0x91, 0x00, 0x3d, 0x00}}},
    {{{     0,      0,      9}, 0, {     0,      0}, {0x91, 0x00, 0x3d, 0x00}}},
    {{{   -10,   1500,     -9}, 0, {     0,      0}, {0x91, 0x00, 0x3d, 0x00}}},
};

const Gfx castle_beta_bartest_dl[] = {
    gsSPLight(&castle_beta_bartest_lights.l, 1),
    gsSPLight(&castle_beta_bartest_lights.a, 2),
    gsSPVertex(castle_beta_bartest_vertex_000, 15, 0),
    gsSP2Triangles( 0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP2Triangles( 6,  7,  8, 0x0,  9, 10, 11, 0x0),
    gsSP1Triangle(12, 13, 14, 0x0),
    gsSPVertex(castle_beta_bartest_vertex_001, 9, 0),
    gsSP2Triangles(0,  1,  2, 0x0,  3,  4,  5, 0x0),
    gsSP1Triangle(6, 7, 8, 0x0),
    gsSPEndDisplayList(),
};
