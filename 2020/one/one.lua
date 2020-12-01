f            = require('libs.file')
--th           = require('libs.table_helper')

local _lines = f:lines_from('2020/one/input.txt', function(line)
    return tonumber(line)
end)

--[[

Find the 2 numbers that equal 2020 and multiply them together

Brute force:
    - Go through each int
    - On each iteration, loop through them all and test for 2020
    - Return early

Single loop:
    - Go through each int
    - Subtract the current int from 2020
    - See if we have already encountered this int
    - If so, return them multiplied
    - Otherwise mark it as encountered and move on
    Eventually, we'll get 2020

]]--

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

local first = solution1()
print(("%d\n"):format(first))
