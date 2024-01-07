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
        local runCommand = "open obsidian://open?vault=" .. vault .. "\\&file=" .. filePath 
        vim.fn.jobstart(runCommand)

        end
    end
end

M.setup = function(opts)
    local vault = opts
    vim.keymap.set("n", "<leader>o", require("obsidianOpener").openObsidian)
end


return M
