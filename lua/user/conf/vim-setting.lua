vim.cmd([[
  let g:local_history_enabled=1     "0: Never (Disable local history plugin),1: Always (Save also a single file which is not in the workspace folder)2: Workspace (Save only files within workspace folder)
  let g:local_history_path="./.local_history"
  let g:local_history_width=30
  let g:local_history_new_change_delay=300    "5mins
  let g:local_history_mappings = {
    \ "move_older": ["j"],
    \ "move_newer": ["k"],
    \ "move_oldest": ["G"],
    \ "move_newest": ["gg"],
    \ "revert": ["<cr>"],
    \ "diff": ["d"],
    \ "delete": ["D"],
    \ "quit": ["q", "Q"],
    \ }
]])


-- only system witih ui server have a clipboard. for ubuntu it's X server. for xsel clipy tools only set when $DISPLAY set. 
-- that is must connect to X server. so here should use user defined clipboard. the clipboard-provider is the bash tool 
-- clipboard-provider is in '~/.local/share/bin/clipboard-provider'. and the copy content will save in tmp file '~/.clipboard-provider.out'
vim.cmd([[
  if executable('clipboard-provider')
  let g:clipboard = {
  \ 'name': 'myClipboard',
  \     'copy': {
  \         '+': 'clipboard-provider copy',
  \         '*': 'clipboard-provider copy',
  \     },
  \     'paste': {
  \         '+': 'clipboard-provider paste',
  \         '*': 'clipboard-provider paste',
  \     },
  \ }
  endif
]])

-- indentBlank plugin current context highlight
vim.cmd([[ highlight IndentBlanklineContextChar guifg=#56B6C2 gui=nocombine ]])
vim.cmd([[ let g:airline#extensions#tabline#fnamemod = ':t' ]])
-- vim.cmd([[ let g:airline_section_c = '%t' ]])


-- disable underline text debug.
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable underline if lsp report some bug, it's very annoying
        underline = false,
        virtual_text = false,
        -- Enable virtual text, override spacing to 4
        -- virtual_text = {spacing = 4},
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        signs = true,
        update_in_insert = false
    })
