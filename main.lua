LuaReload = dofile("lua_reload.lua")
LuaReload.Inject()
LuaReload.SetPrintReloadingLogs(true)

dofile("game.lua")