local emojis = require './emoji-list'
local sijome = {}
local name_list = {}
local emoji_list = {}
for k, v in pairs(emojis) do
    sijome[v] = k
    name_list[#name_list+1] = k
    emoji_list[#emoji_list+1] = v
end

local function strip(query)
    assert(type(query ~= 'string'), 'unable to strip \''
        ..tostring(query)..'\' (a '..type(query).. 'value')

    return query:match('^:.*:$') and query
        :gsub('^:(.*):$', '%1')
        :gsub('[_%-%.]', ''):lower()
end

local function fill(query)
    assert(type(query ~= 'string'), 'unable to fill \''..tostring(query)..'\' (a '..type(query).. 'value')

    return ':'..query..':'
end

local function tone(query, skintone)
    skintone = skintone or ''
    return emojis[strip(query..skintone)] or emojis[strip(query)]
end

local _M = {_emojis = emojis}

_M.dark = "d"
_M.dedium_dark = "md"
_M.medium = "m"
_M.medium_light = "ml"
_M.light = "l"

_M.get = tone

function _M.which(query)
    return fill(sijome[query])
end

function _M.emojify(query, missing, format)
    missing = missing or function() return '' end
    format = format or function(...) return ... end
    return ({query:gsub('%b::', function(emoji)
        local formatted = format(emojis[strip(emoji)])
        return formatted and formatted or missing(formatted)
    end)})[1]
end

function _M.random()
    local choice = math.random(#emojis)
    return {
        emoji = emoji_list[choice],
        key = fill(name_list[choice])
    }
end

function _M.search(query)
    local matches = {}
    for k, v in pairs(emojis) do
        if k:find(query) then
            matches[#matches+1] = {
                emoji = v,
                key = fill(k)
            }
        end
    end
    return matches
end

function _M.unemojify(query)
    for k, v in pairs(emojis) do
        query = query:gsub(v, fill(k))
    end
    return query
end

function _M.find(query)
    for k, v in pairs(emojis) do
        if k == query or v == query then
            return {
                emoji = v,
                key = fill(k)
            }
        end
    end
end

function _M.has(query)
    for k, v in pairs(emojis) do
        if k == query or v == query then
            return true
        end
    end
    return false
end

function _M.strip(query)
    for i = 1, #emoji_list do
        query = query:gsub(emoji_list[i], '')
    end
    return query
end

function _M.replace(query, fn)
    assert(type(fn{key='',emoji=''}) == 'string', 'callback function doesn\'t return a string')
    for k, v in pairs(emojis) do
        query = query:gsub(v, fn({
            emoji = v,
            key = k
        }))
    end
    return query
end

return setmetatable(_M, {__call = function(self, ...) return self.emojify(...) end})
