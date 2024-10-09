function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('dir "'..directory..'" /b /ad')
    
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    
    return t
end

local td = scandir(arg[1])[1]
local list = scandir(arg[1] .. td)
local latest = scandir(arg[1] .. td .. '\\' .. list[#list])
local f = arg[1] .. td .. '\\' .. list[#list] .. '\\'
for _, v in pairs(latest) do
    if v ~= "photos" and v ~= "video_files" then
        os.execute('rmdir "' .. f .. v .. '\\" /s /q')
    end
end
os.execute('del "' .. f .. 'messages.html"')
local photosDir = f .. 'photos\\'
local files = io.popen('dir "' .. photosDir ..'"')
for file in files:lines() do 
    local isThumb = file:sub(#file - 8, #file - 4)
    if isThumb == "thumb" then
        local index = file:find("photo")
        os.execute('del "' .. photosDir .. '\\' .. file:sub(index))
    end
end



