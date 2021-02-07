local emojis = {
    list = require 'emoji.emoji-list',
    reversed = {},
    names = {},
    emojis = {},
}

local insert = table.insert
local random = math.random
local f = string.format

for k, v in pairs(emojis.list) do
    emojis.reversed[v] = k
    insert(emojis.names, k)
    insert(emojis.emojis, v)
end

local length = #emojis.emojis

local function strip(query)
    assert(type(query) == 'string', f('unable to strip "%s" (a "%s" value)', tostring(query), type(query)))
    return query:gsub('[:_%-%.]', ''):lower()
end

local function fill(query)
    assert(type(query) == 'string', f('unable to strip "%s" (a "%s" value)', tostring(query), type(query)))
    return ':'..query..':'
end

local function toTable(emoji, key)
    return {emoji = emoji or '', key = key or ''}
end

local function pass(...) return ... end
local function strop() return '' end
local function keyop(t) return t.emoji end

local emoji = {}

function emoji.get(query)
    return emojis.list[query]
end

function emoji.which(query)
    return emojis.reversed[query]
end

function emoji.emojify(query, missing, format)
    missing = missing or strop
    format = format or pass
    assert(type(missing(toTable())) == 'string', 'callback "missing" does not return a string')
    assert(type(format(toTable())) == 'string', 'callback "format" does not return a string')
    return query:gsub(
        '%b::',
        function(name)
            local formatted = format(emojis.list[strip(name)])
            return formatted or missing(formatted)
        end
    )
end

function emoji.random()
    local choice = random(length)
    return toTable(emojis.emojis[choice], emojis.names[choice])
end

function emoji.search(query)
    local matches = {}
    for k, v in pairs(emojis.list) do
        if k:match(query) then
            insert(matches, toTable(v, k))
        end
    end
    return matches
end

function emoji.unemojify(query)
    for k, v in pairs(emojis.list) do
        query = query:gsub(v, fill(k))
    end
    return query
end

function emoji.find(query)
    local list, reversed = emojis.list[query], emojis.reversed[query]
    return list and toTable(list, fill(query)) or reversed and toTable(query, reversed)
end

function emoji.strip(query)
    for i = 1, length do
        query = query:gsub(emojis.emojis[i], '')
    end
    return query
end

function emoji.replace(query, fn)
    fn = fn or keyop
    assert(type(fn(toTable())) == 'string', 'callback function does not return a string')
    for k, v in pairs(emojis.list) do
        query = query:gsub(v, fn(toTable(v, k)))
    end
    return query
end

return setmetatable(emoji, {__call = function(self, ...) return self.emojify(...) end}), emojis