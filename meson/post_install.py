#!/usr/bin/env python3

from os import environ, path
from subprocess import call

if not environ.get('DESTDIR', ''):
    PREFIX = environ.get('MESON_INSTALL_PREFIX', '/usr')
    print('Updating icon cache...')
call(['gtk-update-icon-cache', '-qtf', path.join(PREFIX, 'share/icons/La Capitaine')])
