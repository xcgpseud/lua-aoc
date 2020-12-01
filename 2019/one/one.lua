f           = require('libs.file')
th          = require('libs.table_helper')

local lines = f:lines_from('one/input1.txt')

function calc1(mass)
    return math.floor((mass / 3)) - 2
end

function calc2(mass)
    if tonumber(mass) <= 0 then
        return 0
    end

    local fuel = calc1(mass)
    return fuel + calc2(fuel)
end

local out1 = th:make(lines)
               :map(function(mass) return calc1(mass) end)
               :sum()
print("Part 1: " .. out1)

local out2 = th:make(lines)
               :map(function(mass) return calc2(mass) end)
               :sum()
print("Part 2: " .. out2)


