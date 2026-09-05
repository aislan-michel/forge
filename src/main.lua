local version = require("version")
local help = require("help")
local new = require("new")

local commandMap = {
    ["version"] = version.get_version,
    ["help"] = help.get_help_message,
    ["new"] = new.create_project
}

local args = { ... }
local command = args[1]

table.remove(args, 1)

if commandMap[command] then
    print(commandMap[command](args))
else
    print("Unknown command")
end