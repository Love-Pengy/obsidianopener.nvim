local vault = { path = 'Development'}

function sleep (sleepSec)
    local sec = tonumber(os.clock() + sleepSec)
    while(os.clock() < sec) do 
    end
end

local function stringParser(inStr)
    escapeString  = string.gsub(inStr, "%[", "\\%[")
    escapeString = string.gsub(escapeString, "%]", "\\%]")
    escapeString = string.gsub(escapeString, "%^", "\\%^")
    escapeString = string.gsub(escapeString, "%$", "\\%$")
    escapeString = string.gsub(escapeString, "%(", "\\%(")
    escapeString = string.gsub(escapeString, "%)", "\\%)")
    escapeString = string.gsub(escapeString, "%%", "\\%%")
    --escapeString = string.gsub(escapeString, "%.", "\\%.")
    escapeString = string.gsub(escapeString, "%*", "\\%*")
    escapeString = string.gsub(escapeString, "%+", "\\%+")
    escapeString = string.gsub(escapeString, "%-", "\\%-")
    escapeString = string.gsub(escapeString, "%?", "\\%?")
    spaceString = string.gsub(escapeString, " ", ("%%" .. "20"))
    print(spaceString)
    return spaceString
end

local function openObsidian()
    local filePath = stringParser(vim.fn.expand("%:t"))
    --vim.cmd("vsplit | terminal")
    local runCommand = "open obsidian://open?vault=" .. vault.path .. "\\&file=" .. filePath 
    --local command = ':!' .. runCommand 
    --print(command)
    vim.fn.jobstart(runCommand)

    --vim.cmd(":bdelete!")
--[[    print("disown")
    sleep(5)
    print("delete")
]]--
end

local function setup(opts)
    local vault = vim.tbl_deep_extend('force', vault, opts)
end

--vim.keymap.set("n", "<leader>o", require("lua/obsidianOpener/init").openObsidian())

return {
    openObsidian = openObsidian
}
