local parser = require("parser")

local new = {}

function new.create_project(args)
    local parsed_args = parser.parse_args(args)

    if parsed_args.success == true then
        return "Creating new project: " .. parsed_args.args.project_name .. "\n" .. "Using template: " .. parsed_args.args.template .. "\n"
    else
        return table.concat(parsed_args.problems, ", ")
    end

end

return new