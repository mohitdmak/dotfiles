vim.cmd[[
    let g:startify_session_dir = '~/.config/nvim/sessions'
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_fortune_use_unicode = 1
    let g:startify_session_persistence = 0

    let g:startify_bookmarks = [
                \ { 'c': '~/.config/nvim' },
                \ { 'i': '~/.config/i3'},
                \ { 'z': '~/.zshrc' },
                \ { 's': '~/legacy_dotfiles/systemd-services'},
                \ { 'S': '~/legacy_dotfiles/scripts'},
                \ { 'l': '~/legacy_dotfiles/batteryPopup'},
                \ { 'o': '~/.oh-my-zsh' },
                \ { 'a': '~/.config/alacritty'},
                \ { 'r': '~/.config/ranger/rc.conf'},
                \ { 't': '~/legacy_dotfiles/tmux'},
                \ { 'b': '~/legacy_dotfiles/bash'},
                \ { 'P': '~/.config/picom'},
                \ { 'T': '~/.local/share/nvim/site/pack/packer/start/tokyonight.nvim'},
                \ { 'R': '~/.config/rofi'},
                \ { 'C': '~/legacy_dotfiles/colorls'},
                \ { 'p': '~/.config/polybar/launch.sh'},
                \ { 'w': '/home/mohitdmak/vault/iam/bio/'}]

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
