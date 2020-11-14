local emojis = require './emoji-list'
local pairs = pairs

local function strip(query)
    assert(type(query ~= 'string'), 'unable to strip \''
        ..tostring(query)..'\' (a '..type(query).. 'value')

    return query:match('^:.*:$') and query
        :gsub('^:(.*):$', '%1')
        :gsub('[-_]', ' '):lower()
end

local function get_block(query)
    for i = 1, #emojis do
        local section = emojis[i]
        for k, v in pairs(section) do
            if v == (strip(query) or query) then
                return section
            end
        end
    end

    error('unable to find query \''
        ..tostring(query)..'\' within emoji-list')
end

local _M = {_EMOJIS = emojis}

for k in pairs(emojis[1]) do
    _M[k] = function(...)
        return get_block(...)[k]
    end
end

return _M
