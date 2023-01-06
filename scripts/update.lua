local cjson = require("cjson")

local function read_file(path)
    local file = io.open(path, "r")
    if not file then
        return nil
    end
    local content = file:read("*a")
    file:close()
    return content
end

local function convert(t)
    local formatted = {}
    -- Iterate over gitmojis
    for _, v in pairs(t.gitmojis) do
        table.insert(formatted, {
            value = v.emoji,
            text = v.code,
            description = v.description,
        })
    end
    return formatted
end

local function dump(obj)
    if type(obj) == "table" then
        local s = "{ "
        for k, v in pairs(obj) do
            if type(v) == "string" then
                v = '"' .. v .. '"'
            end
            -- print(type(k), k, v)
            s = s .. k .. " = " .. dump(v) .. ","
        end
        return s .. "}"
    else
        return tostring(obj)
    end
end

local contents = read_file("/tmp/gitmojis.json")
local t = convert(cjson.decode(contents))

local function todo(x)
    local output = "local emojis = {"
    for k, v in pairs(x) do
        output = output .. dump(v) .. ","
    end
    output = output .. [[
}

return emojis
    ]]
    return output
end

print(todo(t))
