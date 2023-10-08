local emojis = require("telescope._extensions.gitmoji.emojis")

local M = {}

local MAX_TIMESTAMPS = 10
local RECENCY_MODIFIER = {
    [1] = { age = 240, value = 100 }, -- past 4 hours
    [2] = { age = 1440, value = 80 }, -- past day
    [3] = { age = 4320, value = 60 }, -- past 3 days
    [4] = { age = 10080, value = 40 }, -- past week
    [5] = { age = 43200, value = 20 }, -- past month
    [6] = { age = 129600, value = 10 }, -- past 90 days
}
local filename = vim.fn.stdpath("data") .. "/gitmoji-data.json"

local emoji_data

function M:_init()
    if emoji_data ~= nil then
        return
    end
    if vim.fn.filereadable(filename) == 1 then
        local fd = io.open(filename, "r")
        if fd == nil then
            emoji_data = {}
            self:_write()
            return
        end
        local json = fd:read("*a")
        fd:close()
        local decoded = pcall(function()
            emoji_data = vim.json.decode(json)
        end)
        if (not decoded) or (type(emoji_data) ~= "table") then
            emoji_data = {}
        end
    else
        emoji_data = {}
        self:_write()
    end
end

function M:_write()
    local fd = io.open(filename, "w")
    if fd == nil then
        vim.notify("Failed opening file for writing: " .. filename)
        return
    end
    fd:write(vim.json.encode(emoji_data))
    fd:close()
end

function M:record(emoji)
    self:_init()
    if emoji_data[emoji] == nil then
        emoji_data[emoji] = { count = 0, timestamps = {} }
    end
    emoji_data[emoji].count = 1 + emoji_data[emoji].count
    table.insert(emoji_data[emoji].timestamps, os.time())

    while #emoji_data[emoji].timestamps > MAX_TIMESTAMPS do
        table.remove(emoji_data[emoji].timestamps, 1)
    end

    self:_write()
end

local function calculate_score(timestamps)
    local now = os.time()
    local recency_score = 0
    for _, ts in pairs(timestamps) do
        for _, rank in ipairs(RECENCY_MODIFIER) do
            if (now - ts) / 60 <= rank.age then
                recency_score = recency_score + rank.value
                goto continue
            end
        end
        ::continue::
    end

    return recency_score / MAX_TIMESTAMPS
end

function M:_get_scores()
    self:_init()
    local result = {}
    for emoji, data in pairs(emoji_data) do
        result[emoji] = data.count * calculate_score(data.timestamps)
    end
    return result
end

function M:get_sorted_emojis()
    local scores = self:_get_scores()
    table.sort(emojis, function(a, b)
        return (scores[a.value] or -1) > (scores[b.value] or -1)
    end)
    return emojis
end

return M
