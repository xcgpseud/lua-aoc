f  = require('libs.file')
sh = require('libs.string_helper')
th = require('libs.table_helper')

function solution1()
    local lines = f:lines_from("2020/three/input.txt")
    return traverse(lines, 3, 1)
end

function solution2()
    local lines = f:lines_from("2020/three/input.txt")

    return th
            :make({
                 { 1, 1 },
                 { 3, 1 },
                 { 5, 1 },
                 { 7, 1 },
                 { 1, 2 },
             })
            :map(function(slope)
                local x, y = table.unpack(slope)
                return traverse(lines, x, y)
            end)
            :foldl1(function(a, b)
                return a * b
            end)
end

function traverse(slope, xMov, yMov)
    local trees    = 0
    local x        = xMov + 1

    for i = yMov + 1, #slope, yMov do
        local line = slope[i]
        if line:sub(x, x) == '#' then
            trees = trees + 1
        end

        x = (x + xMov) % (line:len() + 1)
        if x == 0 then x = 31 end -- Tables are indexed from 1 so move back to 31 if we hit 0 (╯°□°）╯︵ ┻━┻
    end

    return trees
end

function replaceAt(str, pos, rep)
    return str:sub(1, pos - 1) .. rep .. str:sub(pos + 1)
end

local first = solution1()
print(("%d\n"):format(first))

local second = solution2()
print(("%d\n"):format(second))
