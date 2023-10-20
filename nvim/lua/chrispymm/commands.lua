-- Re-balance windows on resize
vim.api.nvim_create_autocmd( { "VimResized" }, {
    pattern = "*",
    command = "wincmd ="
})

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


-- Set nunjucks files to have a filetype of html for syntax highlighting
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"},{
    pattern = "*.njk",
    callback = function()
        vim.opt_local.filetype = "html"
    end
})
