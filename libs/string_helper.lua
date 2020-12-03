StringHelper = {}

function StringHelper:split(str, delimiter)
    local out = {}

    for match in ("%s%s"):format(str, delimiter):gmatch(("(.-)%s"):format(delimiter)) do
        table.insert(out, match)
    end

    return out
end

function StringHelper:countOccurrences(str, char)
    return select(2, str:gsub(char, ""))
end

return StringHelper
