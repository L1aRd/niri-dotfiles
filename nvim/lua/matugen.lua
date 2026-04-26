 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
     -- Background tones
     base00 = '#181210', -- Default Background
     base01 = '#251e1c', -- Lighter Background (status bars)
     base02 = '#2f2926', -- Selection Background
     base03 = '#a08d85', -- Comments, Invisibles
     -- Foreground tones
     base04 = '#d7c2b9', -- Dark Foreground (status bars)
     base05 = '#ede0db', -- Default Foreground
     base06 = '#ede0db', -- Light Foreground
     base07 = '#ede0db', -- Lightest Foreground
     -- Accent colors
     base08 = '#ffb4ab', -- Variables, XML Tags, Errors
     base09 = '#d0c890', -- Integers, Constants
     base0A = '#e6beac', -- Classes, Search Background
     base0B = '#ffb692', -- Strings, Diff Inserted
     base0C = '#d0c890', -- Regex, Escape Chars
     base0D = '#ffb692', -- Functions, Methods
     base0E = '#e6beac', -- Keywords, Storage
     base0F = '#93000a', -- Deprecated, Embedded Tags
   }
 end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
