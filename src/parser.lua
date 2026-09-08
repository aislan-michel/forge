local template = require("template")

local parser = {}

local response = {
    success = nil,
    problems = {} or nil,
    args = nil
}

local function get_template(args)
    local template_arg = {
        hasTemplate = false,
        template_name = nil,
        count = 0
    }

    for index, arg in ipairs(args) do
        if arg == "--template" then
            template_arg.hasTemplate = true
            template_arg.template_name = args[index + 1]
            template_arg.count = template_arg.count + 1
        end
    end

    return template_arg
end

function parser.parse_args(args)
    local project_name = args[1]
    
    if project_name == nil then
        response.success = false
        table.insert(response.problems, "Please specify a project name")
        return response
    end

    local template_arg = get_template(args)
    if template_arg.count > 1 then
        table.insert(response.problems, "Please specify only one template")
    end

    if template_arg.hasTemplate == false or template_arg.template_name == nil then
        table.insert(response.problems, "Please specify a template name")
    elseif not template.exists(template_arg.template_name) then
        table.insert(response.problems, "Template '" .. template_arg.template_name .. "' does not exist")
    end

    if #response.problems > 0 then
        response.success = false
        return response
    end

    response.success = true
    response.problems = nil
    response.args = {
        project_name = project_name,
        template = template_arg.template_name
    }

    return response
end

return parser