local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  '           ___           ___           ___           ___     ',
  '     /\\  \\         /\\  \\         /\\__\\         /\\  \\    ',
  '    /::\\  \\       /::\\  \\       /:/ _/_       /::\\  \\   ',
  '   /:/\\:\\  \\     /:/\\:\\  \\     /:/ /\\__\\     /:/\\:\\  \\  ',
  '  /:/  \\:\\__\\   /::\\~\\:\\  \\   /:/ /:/  /    /::\\~\\:\\  \\ ',
  ' /:/__/ \\:|__| /:/\\:\\ \\:\\__\\ /:/_/:/  /    /:/\\:\\ \\:\\__\\',
  ' \\:\\  \\ /:/  / \\:\\~\\:\\ \\/__/ \\:\\/:/  /     \\:\\~\\:\\ \\/__/',
  '  \\:\\  /:/  /   \\:\\ \\:\\__\\    \\::/__/       \\:\\ \\:\\__\\  ',
  '   \\:\\/:/  /     \\:\\ \\/__/     \\:\\  \\        \\:\\ \\/__/  ',
  '    \\::/  /       \\:\\__\\        \\:\\__\\        \\:\\__\\    ',
  '     \\/__/         \\/__/         \\/__/         \\/__/    ',
}

dashboard.section.buttons.val = {
  dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
  dashboard.button('g', '  Live grep', ':Telescope live_grep<CR>'),
  dashboard.button('r', '  Restore session', ':lua require("persistence").load()<CR>'),
  dashboard.button('l', '  Restore last session', ':lua require("persistence").load({ last = true })<CR>'),
  dashboard.button('n', '  New file', ':enew<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

alpha.setup(dashboard.opts)
