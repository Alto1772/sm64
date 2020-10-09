const Collision sand_test_seg7_sandtest_collision[] = {
    COL_INIT(),
    COL_VERTEX_INIT(0x49),
    COL_VERTEX(50, 0, -2000),
    COL_VERTEX(1050, 0, -2000),
    COL_VERTEX(800, 0, -1500),
    COL_VERTEX(50, 0, -1500),
    COL_VERTEX(1550, 0, -700),
    COL_VERTEX(2050, 0, -1000),
    COL_VERTEX(2050, 0, 0),
    COL_VERTEX(1550, 0, 0),
    COL_VERTEX(-700, 0, -1500),
    COL_VERTEX(-950, 0, -2000),
    COL_VERTEX(-1450, 0, -700),
    COL_VERTEX(-1950, 0, 0),
    COL_VERTEX(-1950, 0, -1000),
    COL_VERTEX(-1450, 0, 0),
    COL_VERTEX(50, 0, 2000),
    COL_VERTEX(800, 0, 1500),
    COL_VERTEX(1050, 0, 2000),
    COL_VERTEX(50, 0, 1500),
    COL_VERTEX(1550, 0, 700),
    COL_VERTEX(2050, 0, 1000),
    COL_VERTEX(-950, 0, 2000),
    COL_VERTEX(-700, 0, 1500),
    COL_VERTEX(-1450, 0, 700),
    COL_VERTEX(-1950, 0, 1000),
    COL_VERTEX(0, 0, -4700),
    COL_VERTEX(2350, 0, -4700),
    COL_VERTEX(1650, -100, -3350),
    COL_VERTEX(0, -100, -3350),
    COL_VERTEX(3350, -100, -1650),
    COL_VERTEX(4750, 0, -2300),
    COL_VERTEX(4750, 0, 0),
    COL_VERTEX(3350, -100, 0),
    COL_VERTEX(-1650, -100, -3350),
    COL_VERTEX(-2300, 0, -4700),
    COL_VERTEX(-3350, -100, -1650),
    COL_VERTEX(-4700, 0, 0),
    COL_VERTEX(-4700, 0, -2300),
    COL_VERTEX(-3350, -100, 0),
    COL_VERTEX(0, 0, 4700),
    COL_VERTEX(1650, -100, 3350),
    COL_VERTEX(2350, 0, 4700),
    COL_VERTEX(0, -100, 3350),
    COL_VERTEX(3350, -100, 1650),
    COL_VERTEX(4750, 0, 2300),
    COL_VERTEX(-2300, 0, 4700),
    COL_VERTEX(-1650, -100, 3350),
    COL_VERTEX(-3350, -100, 1650),
    COL_VERTEX(-4700, 0, 2300),
    COL_VERTEX(-250, 0, -500),
    COL_VERTEX(250, 0, -500),
    COL_VERTEX(0, -500, 0),
    COL_VERTEX(500, 0, -250),
    COL_VERTEX(500, 0, 250),
    COL_VERTEX(-500, 0, -250),
    COL_VERTEX(-500, 0, 250),
    COL_VERTEX(250, 0, 500),
    COL_VERTEX(-250, 0, 500),
    COL_VERTEX(-1250, -100, -2500),
    COL_VERTEX(-2500, -100, -1150),
    COL_VERTEX(-2500, -100, 0),
    COL_VERTEX(-2500, -100, 1150),
    COL_VERTEX(-1250, -100, 2500),
    COL_VERTEX(0, -100, 2500),
    COL_VERTEX(1250, -100, 2500),
    COL_VERTEX(2500, -100, 1150),
    COL_VERTEX(2500, -100, 0),
    COL_VERTEX(2500, -100, -1150),
    COL_VERTEX(1250, -100, -2500),
    COL_VERTEX(0, -100, -2500),
    COL_VERTEX(600, 400, -1450),
    COL_VERTEX(5000, 400, 2300),
    COL_VERTEX(5000, 400, -1450),
    COL_VERTEX(600, 400, 2300),

    // these should be combined!
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND,4),
    COL_TRI_SPECIAL(2, 1, 0, 0x40),
    COL_TRI_SPECIAL(3, 2, 0, 0x40),
    COL_TRI_SPECIAL(9, 8, 0, 0x40),
    COL_TRI_SPECIAL(8, 3, 0, 0x40),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(6, 5, 4, 0x100),
    COL_TRI_SPECIAL(7, 6, 4, 0x100),
    COL_TRI_SPECIAL(19, 6, 18, 0x100),
    COL_TRI_SPECIAL(6, 7, 18, 0x100),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(4, 1, 2, 0x20),
    COL_TRI_SPECIAL(4, 5, 1, 0x20),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(12, 11, 10, 0x180),
    COL_TRI_SPECIAL(11, 13, 10, 0x180),
    COL_TRI_SPECIAL(11, 23, 22, 0x180),
    COL_TRI_SPECIAL(13, 11, 22, 0x180),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(9, 10, 8, 0x160),
    COL_TRI_SPECIAL(12, 10, 9, 0x160),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(16, 15, 14, 0x2c0),
    COL_TRI_SPECIAL(15, 17, 14, 0x2c0),
    COL_TRI_SPECIAL(21, 20, 14, 0x2c0),
    COL_TRI_SPECIAL(17, 21, 14, 0x2c0),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(16, 18, 15, 0x1e0),
    COL_TRI_SPECIAL(19, 18, 16, 0x1e0),
    COL_TRI_INIT(SURFACE_SHALLOW_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(22, 20, 21, 0x2a0),
    COL_TRI_SPECIAL(22, 23, 20, 0x2a0),

    COL_TRI_INIT(SURFACE_DEFAULT, 48),
    COL_TRI(26, 25, 24),
    COL_TRI(27, 26, 24),
    COL_TRI(30, 29, 28),
    COL_TRI(31, 30, 28),
    COL_TRI(28, 25, 26),
    COL_TRI(28, 29, 25),
    COL_TRI(33, 32, 24),
    COL_TRI(32, 27, 24),
    COL_TRI(36, 35, 34),
    COL_TRI(35, 37, 34),
    COL_TRI(33, 34, 32),
    COL_TRI(36, 34, 33),
    COL_TRI(40, 39, 38),
    COL_TRI(39, 41, 38),
    COL_TRI(43, 30, 42),
    COL_TRI(30, 31, 42),
    COL_TRI(40, 42, 39),
    COL_TRI(43, 42, 40),
    COL_TRI(45, 44, 38),
    COL_TRI(41, 45, 38),
    COL_TRI(35, 47, 46),
    COL_TRI(37, 35, 46),
    COL_TRI(46, 44, 45),
    COL_TRI(46, 47, 44),
    COL_TRI(57, 12, 9),
    COL_TRI(57, 58, 12),
    COL_TRI(58, 59, 12),
    COL_TRI(12, 59, 11),
    COL_TRI(59, 23, 11),
    COL_TRI(59, 60, 23),
    COL_TRI(60, 61, 23),
    COL_TRI(23, 61, 20),
    COL_TRI(61, 62, 20),
    COL_TRI(20, 62, 14),
    COL_TRI(62, 16, 14),
    COL_TRI(62, 63, 16),
    COL_TRI(63, 64, 19),
    COL_TRI(63, 19, 16),
    COL_TRI(19, 65, 6),
    COL_TRI(64, 65, 19),
    COL_TRI(6, 66, 5),
    COL_TRI(65, 66, 6),
    COL_TRI(5, 67, 1),
    COL_TRI(66, 67, 5),
    COL_TRI(67, 68, 1),
    COL_TRI(1, 68, 0),
    COL_TRI(68, 57, 0),
    COL_TRI(57, 9, 0),
    COL_TRI_INIT(SURFACE_DEFAULT, 14),
    COL_TRI(50, 49, 48),
    COL_TRI(50, 52, 51),
    COL_TRI(54, 50, 53),
    COL_TRI(56, 55, 50),
    COL_TRI(53, 50, 48),
    COL_TRI(50, 51, 49),
    COL_TRI(54, 56, 50),
    COL_TRI(55, 52, 50),
    COL_TRI(51, 4, 2),
    COL_TRI(51, 7, 4),
    COL_TRI(51, 52, 7),
    COL_TRI(52, 18, 7),
    COL_TRI(18, 52, 15),
    COL_TRI(52, 55, 15),
    COL_TRI_INIT(SURFACE_DEEP_QUICKSAND, 4),
    COL_TRI(10, 53, 8),
    COL_TRI(8, 48, 3),
    COL_TRI(53, 48, 8),
    COL_TRI(13, 53, 10),
    COL_TRI_INIT(SURFACE_INSTANT_QUICKSAND, 3),
    COL_TRI(3, 49, 2),
    COL_TRI(48, 49, 3),
    COL_TRI(49, 51, 2),
    COL_TRI_INIT(SURFACE_SHALLOW_QUICKSAND, 3),
    COL_TRI(55, 17, 15),
    COL_TRI(55, 56, 17),
    COL_TRI(56, 21, 17),
    COL_TRI_INIT(SURFACE_QUICKSAND, 4),
    COL_TRI(56, 54, 21),
    COL_TRI(54, 22, 21),
    COL_TRI(54, 53, 13),
    COL_TRI(22, 54, 13),

    // come on pls concat it
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(67, 26, 27, 0x40),
    COL_TRI_SPECIAL(68, 67, 27, 0x40),
    COL_TRI_SPECIAL(32, 57, 27, 0x40),
    COL_TRI_SPECIAL(57, 68, 27, 0x40),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(31, 28, 66, 0x100),
    COL_TRI_SPECIAL(65, 31, 66, 0x100),
    COL_TRI_SPECIAL(42, 31, 64, 0x100),
    COL_TRI_SPECIAL(31, 65, 64, 0x100),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(66, 26, 67, 0x20),
    COL_TRI_SPECIAL(66, 28, 26, 0x20),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(34, 37, 58, 0x180),
    COL_TRI_SPECIAL(37, 59, 58, 0x180),
    COL_TRI_SPECIAL(37, 46, 60, 0x180),
    COL_TRI_SPECIAL(59, 37, 60, 0x180),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(32, 58, 57, 0x160),
    COL_TRI_SPECIAL(34, 58, 32, 0x160),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 4),
    COL_TRI_SPECIAL(39, 63, 41, 0x2c0),
    COL_TRI_SPECIAL(63, 62, 41, 0x2c0),
    COL_TRI_SPECIAL(61, 45, 41, 0x2c0),
    COL_TRI_SPECIAL(62, 61, 41, 0x2c0),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(39, 64, 63, 0x1e0),
    COL_TRI_SPECIAL(42, 64, 39, 0x1e0),
    COL_TRI_INIT(SURFACE_DEEP_MOVING_QUICKSAND, 2),
    COL_TRI_SPECIAL(60, 45, 61, 0x2a0),
    COL_TRI_SPECIAL(60, 46, 45, 0x2a0),

    // what serve this purpose, its a sand test
    COL_TRI_INIT(SURFACE_HANGABLE, 2),
    COL_TRI(71, 70, 69),
    COL_TRI(70, 72, 69),
    COL_TRI_STOP(),
    COL_END(),
};
