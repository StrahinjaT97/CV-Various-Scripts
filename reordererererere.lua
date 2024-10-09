local file = io.open(arg[1], "r")
local newLines = {}
local currentNumber = 0
local tempFile = io.tmpfile()

function isDigit(c)
    if c == "1" or c == "2" or c == "3" or c == "4" or c == "5" or c == "6" or c == "7" or c == "8" or c == "9" or c == "0" then return true end
    return false
end

function isNumber(line)
    local i = 1
    local str = ""
    while i <= #line do
        if isDigit(line:sub(i, i)) then
            str = str .. line:sub(i, i)
        else
            break
        end
        i = i + 1
    end
    if str == "" then return nil end
    return str
end

function populateTable()
    for line in file:lines() do
        table.insert(newLines, line)
    end  
end

function populateTempFile()
    for _, line in ipairs(newLines) do
        local numStr = isNumber(line)
        if numStr ~= nil then
            currentNumber = currentNumber + 1
            num = tonumber(numStr)
            if num ~= currentNumber then
                local newLine = currentNumber .. string.sub(line, #numStr + 1)
                tempFile:write(newLine)
            else
                tempFile:write(line)
            end
        else
            tempFile:write(line)
        end
        tempFile:write("\n")
    end
end

function rewriteFile()
    tempFile:seek("set")
    for line in tempFile:lines() do
        file:write(line)
        file:write("\n")
    end
end

function main()
    populateTable()
    populateTempFile()

    file:close()
    file = io.open(arg[1], "w")

    rewriteFile()

    file:close()
end

main()







