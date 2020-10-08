const GeoLayout geo_funhouse[] = {
    GEO_NODE_SCREEN_AREA(10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2),
    GEO_OPEN_NODE(),
// for some reason, this is opted out... but when added in, displays a grayish background
// (resulting in a mirror effect seen in some games when you go out of bounds)
//      GEO_ZBUFFER(0),
//          GEO_OPEN_NODE(),
//              GEO_NODE_ORTHO(100),
//              GEO_OPEN_NODE(),
//                  GEO_BACKGROUND_COLOR(0x5533), // rgb(10, 10, 25)
//                  GEO_CLOSE_NODE(),
//          GEO_CLOSE_NODE(),
        GEO_ZBUFFER(1),
        GEO_OPEN_NODE(),
            GEO_CAMERA_FRUSTUM_WITH_FUNC(45, 100, 12800, geo_camera_fov),
            GEO_OPEN_NODE(),
                GEO_CAMERA(1, 0, 2000, 6000, -6144, 0, -6144, geo_camera_main),
                GEO_OPEN_NODE(),
                    GEO_DISPLAY_LIST(LAYER_OPAQUE, funhouse_seg7_dl),
                    GEO_RENDER_OBJ(),
                    GEO_ASM(0, geo_envfx_main),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_END(),
};
