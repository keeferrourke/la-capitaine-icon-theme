# Troubleshooting
If you have problems with the La Capitaine Icon Theme, please read the following sections before submitting an issue on GitHub. `.desktop` files usually can be found in `/usr/share/applications/` (accessible for all users) or in `~/.local/share/applications/` (accessible for the current user). To see if some application icon is available in La Capitaine, just browse `apps/scalable/` in this repository and have a look. If you got lucky, the icon can be applied to any application by placing `Icon=cool-icon-name` in the application's `.desktop` file, assuming `apps/scalable/cool-icon-name.svg` exists.

## No icon gets themed
### Your environment is not supported
This could be due to your desktop environment or system not being supported. Some older environments, mostly ugly ones :wink:, are not supporting SVG icons. The solution is rasterizing the vector graphics, which is not planned for now. See [the Wiki section for supported environments](https://github.com/keeferrourke/la-capitaine-icon-theme/wiki#supported-environments) for more information.

### The icon theme installation is faulty or not accessible for the current user
First of all make sure, that you have copied the `la-capitaine-icon-theme` (name doesn't matter) folder into either `/usr/share/applications/` or `~/.local/share/applications/`, as described in the first paragraph of this document.
It now should be selectable in your system Theme settings or a tweak tool for your desktop. If not, try closing and re-opening the application you use for theming.

If that doesn't work either, double-check if the incon theme folder was copied properly and into the correct folder. For the system-wide one, you might need root previleges. If you have multiple users on the machine, look if you chose the home directory of the user currently logged in (for a local install).

## Some Icons are unthemed
### The missing icon is not (yet) included
This is indeed very common, since La Capitaine is far away from being complete. However, the diversity of Linux distributions is tricky here, since most of them give each distribution-specific application its own name. And there are a lot of them out there...

If there's no icon for your application present in La Capitaine (for instructions how to check this, read the first paragraph in this document), you might submit an [icon request](https://github.com/keeferrourke/la-capitaine-icon-theme/wiki/Submitting-Icon-Requests) or even an [pull request](https://github.com/keeferrourke/la-capitaine-icon-theme/wiki/Submitting-Pull-Requests), but make sure to provide all the necessary information.

### The icon path is hardcoded in the `.desktop` file of the problematic application
Sadly, this is also somewhat common. Some maintainers and packagers hardcode the application's icon in the `.desktop` file, so the application will always use the default icon. You can at least edit the file manually, and even better, report it to the developers/maintainers.

If the icon for the problematic application exists in La Capitaine, just edit the given path to a more general icon name. The following list contains applications which may ship with hardcoded icons:

Name | Find in the `.desktop` file | Replace by
------------ | ------------- | -------------
Nemo | `Icon=folder` | `Icon=nemo`
Gcolor2 | `Icon=/usr/share/pixmaps/gcolor2/gcolor2.xpm` | `Icon=gcolor2`
PyCharm | `Icon=/opt/pycharm-xxx/bin/pyCharm.png` | `Icon=pycharm`
Python 2.x | `Icon=/usr/share/pixmaps/python2.x.xpm` | `Icon=python2` or `Icon=python2.x`, as you wish
Python 3.x | `Icon=/usr/share/pixmaps/python3.x.xpm` | `Icon=python3` or `Icon=python3.x`, as you wish

This list is just what we have noticed, it might or might not be true on your machine. If you found another candidate for the list, tell us!
