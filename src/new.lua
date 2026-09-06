local template = require("template")

local new = {}

local function get_template(args)
    local template = {
        hasTemplate = false,
        template_name = nil,
        count = 0
    }

    for index, arg in ipairs(args) do
        if arg == "--template" then
            template.hasTemplate = true
            template.template_name = args[index + 1]
            template.count = template.count + 1
        end
    end

    return template
end

function new.create_project(args)
    local project_name = args[1]
    local response = ""
    
    if project_name == nil then
        response = "Please specify a project name\n"
        return response
    else
        response = "Creating new project: " .. project_name .. "\n"
    end
    
    local template_arg = get_template(args)
    if template_arg.count > 1 then
        response = response .. "Please specify only one template\n"
        response = response .. template.get_available_templates_message()
        return response
    end

    if template_arg.hasTemplate == false or template_arg.template_name == nil then
        response = response .. "Please specify a template name\n"
        response = response .. template.get_available_templates_message()
        return response
    end

    if not template.exists(template_arg.template_name) then
        response = response .. "Template '" .. template_arg.template_name .. "' does not exist\n"
        response = response .. template.get_available_templates_message()
        return response
    end

    response = response .. "Using template: " .. template_arg.template_name .. "\n"
    return response
end

return new