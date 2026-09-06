local template = require("template")

local new = {}

local function get_template_name(args)
    local template_name = nil

    for index, arg in ipairs(args) do
        if arg == "--template" then
            template_name = args[index + 1]
        end
    end

    return template_name
end

function new.create_project(args)
    local project_name = args[1]
    local template_name = get_template_name(args)
    local response = ""

    if project_name == nil then
        response = "Please specify a project name\n"
    else
        response = "Creating new project: " .. project_name .. "\n"
    end

    if template_name == nil then
        response = response .. "Please specify a template name\n"
        response = response .. template.get_available_templates_message()
        return response
    end

    if not template.exists(template_name) then
        response = response .. "Template '" .. template_name .. "' does not exist\n"
        response = response .. template.get_available_templates_message()
        return response
    end

    response = response .. "Using template: " .. template_name .. "\n"
    return response
end

return new