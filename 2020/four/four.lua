f  = require('libs.file')
sh = require('libs.string_helper')

function solution1()
    local lines     = f:lines_from("2020/four/input.txt")
    local passports = splitIntoPassportDatum(lines)

    local valid     = 0
    for _, passport in ipairs(passports) do
        if isValid1(passport) then
            valid = valid + 1
        end
    end

    return valid
end

function isValid1(passport)
    local required = {
        "byr",
        "iyr",
        "eyr",
        "hgt",
        "hcl",
        "ecl",
        "pid",
    }

    for _, req in ipairs(required) do
        if passport[req] == nil then
            return false
        end
    end

    return true
end

function solution2()
    local lines     = f:lines_from("2020/four/input.txt")
    local passports = splitIntoPassportDatum(lines)

    local valid     = 0
    for _, passport in ipairs(passports) do
        if isValid2(passport) then
            valid = valid + 1
        end
    end

    return valid
end

function isValid2(passport)
    local validations = {
        byr = function(value)
            local n = tonumber(value)
            return n >= 1920 and n <= 2002
        end,
        iyr = function(value)
            local n = tonumber(value)
            return n >= 2010 and n <= 2020
        end,
        eyr = function(value)
            local n = tonumber(value)
            return n >= 2020 and n <= 2030
        end,
        hgt = function(value)
            local n, m = tonumber(value:sub(0, -3)), value:sub(-2)
            return (m == "cm" and (n >= 150 and n <= 193)) or (m == "in" and (n >= 59 and n <= 76))
        end,
        hcl = function(value)
            return value:len() == 7 and value:match("#[0-9]*[a-f]*")
        end,
        ecl = function(value)
            local valid = {
                amb = true,
                blu = true,
                brn = true,
                gry = true,
                grn = true,
                hzl = true,
                oth = true,
            }
            return valid[value] ~= nil
        end,
        pid = function(value)
            return value:len() == 9 and tonumber(value) ~= nil
        end
    }

    for k, fn in pairs(validations) do
        if passport[k] == nil or not fn(passport[k]) then
            return false
        end
    end

    return true
end

function splitIntoPassportDatum(lines)
    local out     = {}
    local current = {}

    for _, line in ipairs(lines) do
        if sh:trim(line) == "" then
            table.insert(out, shallowCopy(current))
            current = {}
            goto continue
        end

        sections = sh:split(line, ' ')
        for _, section in ipairs(sections) do
            local k, v = table.unpack(sh:split(section, ':'))
            current[k] = sh:trim(v)
        end

        :: continue ::
    end

    table.insert(out, current)

    return out
end

function shallowCopy(tbl)
    local copy = {}

    for k, v in pairs(tbl) do
        copy[k] = v
    end

    return copy
end

print(("%d\n%d\n"):format(solution1(), solution2()))