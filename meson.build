project('la-capitaine-icon-theme',
    version: '0.5.0',
    meson_version: '>= 0.40',
    license: ['GPL-3.0', 'MIT'],
    default_options: ['prefix=/usr']
)

install_data(['configure', 'COPYING', 'index.theme', 'LICENSE'],
    install_dir : join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('actions',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('animations',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('apps',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('devices',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('emblems',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('emotes',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('mimetypes',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('panel',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('places',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)
install_subdir('status',
    install_dir: join_paths(get_option('prefix'), 'share/icons/La-Capitaine')
)

meson.add_install_script('meson/post_install.py')
