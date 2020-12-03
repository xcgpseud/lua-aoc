f            = require('libs.file')
sh           = require('libs.string_helper')

local _lines = f:lines_from('2020/two/input.txt')

function solution1()
    local validCount = 0

    for _, line in ipairs(_lines) do
        local char, min, max, pass = readLine(line)

        if validatePass1(min, max, char, pass) then
            validCount = validCount + 1
        end
    end

    return validCount
end

function validatePass1(min, max, char, pass)
    local count = sh:countOccurrences(pass, char)
    return count >= min and count <= max
end

function solution2()
    local validCount = 0

    for _, line in ipairs(_lines) do
        local char, min, max, pass = readLine(line)

        if validatePass2(min, max, char, pass) then
            validCount = validCount + 1
        end
    end

    return validCount
end

function validatePass2(min, max, char, pass)
    local atMin, atMax = pass:sub(min, min), pass:sub(max, max)

    return (atMin == char and atMax ~= char
            or
            atMax == char and atMin ~= char)
end

function readLine(line)
    -- char, min, max, pass
    local rules, pass  = table.unpack(sh:split(line, ": "))
    local counts, char = table.unpack(sh:split(rules, " "))
    local min, max     = table.unpack(sh:split(counts, "-"))

    return char, tonumber(min), tonumber(max), pass
end

local first = solution1()
print(("%d\n"):format(first))

local second = solution2()
print(("%d\n"):format(second))
