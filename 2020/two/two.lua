f = require('libs.file')
sh = require('libs.string_helper')

local _lines = f:lines_from('2020/two/input.txt')

function solution1()
    local validCount = 0

    for _, line in ipairs(_lines) do
        local char, min, max, pass = readLine(line)
        local count = sh:countOccurrences(pass, char)

        if count >= min and count <= max then
            validCount = validCount + 1
        end
    end

    return validCount
end

function readLine(line) -- char, min, max, pass
    local rules, pass = table.unpack(sh:split(line, ": "))
    local counts, char = table.unpack(sh:split(rules, " "))
    local min, max = table.unpack(sh:split(counts, "-"))

    return char, tonumber(min), tonumber(max), pass
end

local first = solution1()
print(("%s\n"):format(first))
