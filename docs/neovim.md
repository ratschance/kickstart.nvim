## Movement and view
`Ctrl+U` / `Ctrl+D` - half-page up/down
`Ctrl+F` / `Ctrl+B` - full-page forward/back
`H` / `M` / `L` - top/middle/bottom of screen
`zz` / `zt` / `zb` - center/top/bottom current line
`%` - jump between matching delimiters
`f{char}` / `;` / `,` - find and repeat character

## Editing and text objects
`ci(`/`ci[`/`ci{` - change inside delimiter
`da(`/`da[`/`da{` - delete delimiter and contents
`J` - join lines

## Registers
`"{reg}{command}` - use a named register
`"ayy` / `"ap` - yank to / paste from register `a`
`"0p` - paste the last yank
`"+y` / `"+p` - system clipboard
`"_d` - delete without changing registers
`Ctrl+R {reg}` - insert a register in Insert mode
`:reg` - inspect registers

## Macros
`q{reg}` - start recording into a register
`q` - stop recording
`@{reg}` - replay a macro
`@@` - replay the last macro
`:{range}normal @{reg}` - run a macro over a range

## Search and substitution
`*` / `#` - search for the word under the cursor
`:g/pattern/command` - run a command on matching lines

## Surround
`ys` - add a surrounding pair
`ds` - delete a surrounding pair
`cs` - change a surrounding pair
`S` - surround the visual selection

## Commands and inserted output
`:!{cmd}` - run a shell command
`:read !{cmd}` - insert command output below the cursor
`:.!{cmd}` - replace the current line with command output
`:'<,'>!{cmd}` - filter the visual selection through a command
`:normal {keys}` - execute Normal-mode keys
`:execute {expr}` - execute a generated Ex command

## Windows and buffers
`Ctrl+W o` - close all other windows
`Ctrl+W =` - equalize window sizes
`:bn` / `:bp` - next/previous buffer
`:bd` - delete the current buffer
`Ctrl+^` - switch to the alternate buffer
`Ctrl+\` - toggle the Snacks terminal (Normal or terminal mode)
`Ctrl+H` / `Ctrl+J` / `Ctrl+K` / `Ctrl+L` - navigate Neovim windows and tmux panes

## Neovim and LSP
`[g` / `]g` - previous/next diagnostic

## Discovery
`:help {topic}` - open help
`:verbose map {key}` - find a mapping's source
`:checkhealth` - inspect Neovim health
`:messages` - show recent messages
