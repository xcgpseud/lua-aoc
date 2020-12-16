StringHelper = {}

function StringHelper:split(str, delimiter)
    delimiter = delimiter or nil

    local out = {}

    local tbl = delimiter == nil
            and str:gmatch(".")
            or ("%s%s"):format(str, delimiter):gmatch(("(.-)%s"):format(delimiter))

    for match in tbl do
        table.insert(out, match)
    end

    return out
end

function StringHelper:countOccurrences(str, char)
    return select(2, str:gsub(char, ""))
end

function StringHelper:trim(str)
    return str:gsub("^%s*(.-)%s*$", "%1")
end

return StringHelper
