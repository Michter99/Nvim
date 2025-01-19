-- Function to get a custom tabline showing listed buffers with relative paths
vim.o.showtabline = 2 -- Always show the tabline
vim.o.tabline = "%!v:lua.Tabline()"

vim.cmd([[
highlight TabLine guibg=#282c34 guifg=#abb2bf
highlight TabLineSel guibg=#6742a8 guifg=#282c34
highlight TabLineFill guibg=#1e222a guifg=#1e222a
]])

function _G.Tabline()
    local s = ""
    local current = vim.fn.bufnr('%') -- Current buffer number

    for _, bufinfo in ipairs(vim.fn.getbufinfo({ buflisted = true })) do
        local buf_name = vim.fn.fnamemodify(bufinfo.name, ":~:.") -- Get the relative path
        local highlight = (bufinfo.bufnr == current) and "%#TabLineSel#" or "%#TabLine#"

        s = s .. highlight .. " " .. buf_name .. " "
    end

    s = s .. "%#TabLineFill#" -- Fills the rest of the tabline
    return s
end

-- Function to move to the next buffer
local function next_buffer()
    if vim.fn.buflisted(vim.fn.bufnr('%')) == 0 then
        return -- No listed buffer, do nothing
    end
    vim.cmd("bnext")
end

-- Function to move to the previous buffer
local function prev_buffer()
    if vim.fn.buflisted(vim.fn.bufnr('%')) == 0 then
        return -- No listed buffer, do nothing
    end
    vim.cmd("bprev")
end

-- Function to close the current buffer
local function close_buffer()
    -- Get the filetype of the current buffer
    local ft = vim.bo.filetype

    if ft == "netrw" then
        -- Close Netrw specifically
        vim.cmd("bwipeout")
        return
    end

    -- If no listed buffer, do nothing
    if vim.fn.buflisted(vim.fn.bufnr('%')) == 0 then
        return
    end

    -- Close the current buffer
    vim.cmd("bdelete")
end

-- Key mappings for navigating buffers
vim.keymap.set("n", "<Tab>", next_buffer, { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", prev_buffer, { desc = "Previous Buffer" })

-- Key mapping to close the current buffer
vim.keymap.set("n", "<leader>q", close_buffer, { desc = "Close Current Buffer" })

