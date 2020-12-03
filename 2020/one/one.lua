f            = require('libs.file')

local _lines = f:lines_from('2020/one/input.txt', function(line)
    return tonumber(line)
end)

function solution1()
    local encountered = {}

    for _, i in ipairs(_lines) do
        local rem = 2020 - i
        if encountered[rem] ~= nil then
            return rem * i
        end
        encountered[i] = true
    end

    return 0
end

-- triple loop for now, work on a more elegant solution in the future
function solution2()
    for i = 1, #_lines do
        for j = 1, #_lines do
            for k = 1, #_lines do
                if _lines[i] + _lines[j] + _lines[k] == 2020 then
                    return _lines[i] * _lines[j] * _lines[k]
                end
            end
        end
    end

    return 0
end

local first = solution1()
print(("%d\n"):format(first))

local second = solution2()
print(("%d\n"):format(second))
