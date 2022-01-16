vim.cmd[[
    let g:startify_session_dir = '~/dotfiles/neovim/.config/nvim/sessions'
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_fortune_use_unicode = 1
    let g:startify_session_persistence = 0

    let g:startify_bookmarks = [
                \ { 'c': '~/dotfiles/neovim/.config/nvim' },
                \ { 'i': '~/dotfiles/i3wm/.config/i3'},
                \ { 'z': '~/dotfiles/zsh/.zshrc' },
                \ { 'o': '~/dotfiles/ohmyzsh/.oh-my-zsh' },
                \ { 'a': '~/dotfiles/alacritty/.config/alacritty'},
                \ { 't': '~/dotfiles/tmux'},
                \ { 'T': '~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim'},
                \ { 'r': '~/dotfiles/rofi/.config/rofi'},
                \ { 'C': '~/dotfiles/colorls'},
                \ { 'b': '~/dotfiles/bash'},
                \ { 'P': '~/dotfiles/picom/.config/picom'},
                \ { 'p': '~/dotfiles/polybar-bitmap/.config/polybar/cuts'},
                \ { 'w': '~/Semester::2:1/ZNotes'}]

    let g:startify_lists = [
              \ { 'type': 'sessions',  'header': ['   Sessions']                     },
              \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
              \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
              \ { 'type': 'files',     'header': ['   MRU']                        },
              \ ]

    let g:startify_custom_header = [
            \'      :::   :::     ::::::::   :::    ::: ::::::::::: ::::::::::: :::::::::  :::   :::       :::       :::    :::' ,
            \'     :+:+: :+:+:   :+:    :+: :+:    :+:     :+:         :+:     :+:    :+: :+:+: :+:+:    :+: :+:    :+:   :+:'   ,
            \'    +:+ +:+:+ +:+ +:+    +:+ +:+    +:+     +:+         +:+     +:+    +:+ +:+ +:+:+ +:+  +:+   +:+  +:+  +:+'     ,
            \'   +#+  +:+  +#+ +#+    +:+ +#++:++#++     +#+         +#+     +#+    +:+ +#+  +:+  +#+ +#++:++#++: +#++:++'       ,
            \'  +#+       +#+ +#+    +#+ +#+    +#+     +#+         +#+     +#+    +#+ +#+       +#+ +#+     +#+ +#+  +#+'       ,
            \' #+#       #+# #+#    #+# #+#    #+#     #+#         #+#     #+#    #+# #+#       #+# #+#     #+# #+#   #+#'       ,
            \'###       ###  ########  ###    ### ###########     ###     #########  ###       ### ###     ### ###    ###'      , 
            \]
]]
