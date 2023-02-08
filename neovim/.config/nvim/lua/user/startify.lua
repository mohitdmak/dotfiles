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
                \ { 's': '~/dotfiles/systemd-services'},
                \ { 'S': '~/dotfiles/scripts'},
                \ { 'l': '~/dotfiles/batteryPopup'},
                \ { 'o': '~/dotfiles/ohmyzsh/.oh-my-zsh' },
                \ { 'a': '~/dotfiles/alacritty/.config/alacritty'},
                \ { 'r': '~/dotfiles/ranger/.config/ranger/rc.conf'},
                \ { 't': '~/dotfiles/tmux'},
                \ { 'b': '~/dotfiles/bash'},
                \ { 'P': '~/dotfiles/picom/.config/picom'},
                \ { 'T': '~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim'},
                \ { 'R': '~/dotfiles/rofi/.config/rofi'},
                \ { 'C': '~/dotfiles/colorls'},
                \ { 'p': '~/dotfiles/polybar-bitmap/.config/polybar/cuts'},
                \ { 'w': '~/vault/iam/bio/'}]

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
