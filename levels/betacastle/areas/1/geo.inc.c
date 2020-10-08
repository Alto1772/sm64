const GeoLayout geo_betacastle[] = {
    GEO_NODE_SCREEN_AREA(10, SCREEN_WIDTH/2, SCREEN_HEIGHT/2, SCREEN_WIDTH/2, SCREEN_HEIGHT/2),
    GEO_OPEN_NODE(),
        GEO_ZBUFFER(0),
        GEO_OPEN_NODE(),
            GEO_NODE_ORTHO(100),
            GEO_OPEN_NODE(),
                GEO_BACKGROUND_COLOR(0x033F), //rgb(0, 12, 31) * its just a blue sky *
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
        GEO_ZBUFFER(1),
        GEO_OPEN_NODE(),
            GEO_CAMERA_FRUSTUM_WITH_FUNC(45,100,12800,geo_camera_fov),
            GEO_OPEN_NODE(),
                GEO_CAMERA(1, 0, 2000, 6000, -6144, 0, -6144, geo_camera_main),
                GEO_OPEN_NODE(),
                    GEO_DISPLAY_LIST(LAYER_OPAQUE, betacastle_seg7_dl),
                    /* (hack to render water)
                     -  uncomment (also remove this)
                     -  and reference betacastle's
                     -  movtex.inc.c to moving_texture.c,
                     -  otherwise it won't render
                    GEO_ASM(0, geo_movtex_pause_control),
                    GEO_ASM(*specify id here*, geo_movtex_draw_water_regions),
                     - study moving_texture.c first
                     - and put the id here
                    */
                    GEO_RENDER_OBJ(),
                    GEO_ASM(0, geo_envfx_main),
                    GEO_CLOSE_NODE(),
                GEO_CLOSE_NODE(),
            GEO_CLOSE_NODE(),
        GEO_CLOSE_NODE(),
    GEO_END(),
};
