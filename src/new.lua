local template = require("template")

local new = {}

function new.create_project(args)
    local project_name = args[1]
    local template_name = args[3]

    local response = ""
    if project_name == nil then
        response = "Please specify a project name\n"
    else
        response = "Creating new project: " .. project_name .. "\n"
        -- Here you would add the logic to create a new project
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