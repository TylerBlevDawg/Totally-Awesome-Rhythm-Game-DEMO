-- Settings here

local C = {
    FIRST_KEY = "j",
    SECOND_KEY = "k",
    OFFSET = 0,
    PERF_THRESH = 30,
    GOOD_THRESH = 70,
    DISPLAY_FPS = 1,
    VSYNC = 1,
}

love.window.setVSync(C.VSYNC)

return C