LuaReload = dofile("Code/lua_reload.lua")
LuaReload.Inject()
LuaReload.SetPrintReloadingLogs(true)
Object = require "Code/classic"

dofile("game.lua")