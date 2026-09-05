local template = {}

function template.get_templates()
    return {"dotnet-mvc", "dotnet-api", "dotnet-classlib"}
end

function template.exists(template_name)
    if not template_name then
        return false
    end

    local templates = template.get_templates()
    for _, name in ipairs(templates) do
        if name == template_name then
            return true
        end
    end
    return false
end

function template.get_available_templates_message()
    local templates = template.get_templates()
    return "Available templates: " .. table.concat(templates, ", ") .. "\n"
end

return template