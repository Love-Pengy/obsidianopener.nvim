local M = {}

local vault = ''


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

M.openObsidian = function()
    if vault == nil then 
        vim.cmd(":echo 'Vault not specified'")
    else
        local filePath = stringParser(vim.fn.expand("%:t"))
        --vim.cmd("vsplit | terminal")
        local runCommand = "open obsidian://open?vault=" .. vault .. "\\&file=" .. filePath 
        --local command = ':!' .. runCommand 
        --print(command)
        vim.fn.jobstart(runCommand)
    end
end
    --vim.cmd(":bdelete!")
--[[    print("disown")
    sleep(5)
    print("delete")
]]--

M.setup = function(opts)
    --local vault = vim.tbl_deep_extend('force', vault, opts)
    local vault = opts
    vim.keymap.set("n", "<leader>o", require("lua/obsidianOpener/init").openObsidian)
end


return M
