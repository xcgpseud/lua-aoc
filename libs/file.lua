File = {}

-- see if the file exists
function File:file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function File:lines_from(file, onEach)
    onEach = onEach or nil

    if not self:file_exists(file) then return {} end
    lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = onEach ~= nil and onEach(line) or line
    end
    return lines
end

return File
