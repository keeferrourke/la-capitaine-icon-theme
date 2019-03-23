project('la-capitaine-icon-theme',
    version: 'v0.6.1',
    license: 'GPL3',
    default_options: ['prefix=/usr']
)

install_subdir('.',
    exclude_files : [ '.gitignore'
      , 'configure'
      , 'COPYING'
      , 'Credits.md'
      , 'LICENSE'
      , 'meson.build'
      , 'README.md'
      , 'Thanks.md'
    ],

    exclude_directories : [ '.git'
      , '.github'
      , '.product'
      , 'build'
      , 'meson'
      , 'actions/22x22'
      , 'devices/scalable'
      , 'status/scalable'
      , 'panel/16'
      , 'panel/24'
      , 'places/16x16'
    ],

    install_dir: join_paths(get_option('prefix'), 'share/icons/La Capitaine')
)

meson.add_install_script('meson/post_install.py')
