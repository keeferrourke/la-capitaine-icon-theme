# Troubleshooting
If you have problems with the La Capitaine icon theme, please read the
following sections before submitting an issue on GitHub. This document attempts
to outline most of the common problems one might encounter with icon themes.

## Necessary Background

### What is a desktop file?
`.desktop` files are text files that can usually be found in either
`/usr/share/applications/` (accessible for all users) or in
`~/.local/share/applications/` (accessible for the current user). These files
tell your desktop environment how to display and create launchers for your
desktop applications.

### How do desktop environments know which images to use as icons?
A `.desktop` file also contains the name of an icon image, or a path to an icon
which should be used in the desktop launcher. Sometimes the information in
these files might cause some problems with theming.


## Some common problems

### An application on my desktop isn't themed!
To start your diagnosis, first look through this repository. You will likely
find an appropriate icon somewhere. To see if some application icon is
available in La Capitaine, just browse `apps/scalable/` in this repository;
try searching for the name of a particular application, or a keyword that is
related to the application (e.g. search for "gedit" or "editor" if the launcher
for your GNOME text editor looks funny).

If your application launcher looks funny after applying La Capitaine
as your desktop icon theme, 1) there might be a problem with the `.desktop`
files on your system, or 2) the application might not yet be themed.

 1. The icon path in the relevant `.desktop` file is malformed

Sadly, this is somewhat common. Some maintainers and packagers hardcode the
application's icon in the `.desktop` file, so the application will always use
the default icon. You can at least edit the file manually, and even better,
report it to the developers/maintainers.

If the icon for the problematic application exists in La Capitaine, just edit
the given path to a more general icon name.

Example: if `foo-application` is not themed properly, look for "foo" in the
`apps/scalable/` directory. If you find `foo-icon-name.svg`, you can add
`Icon=foo-icon-name` to the application's `.desktop` file, assuming
`apps/scalable/foo-icon-name.svg` exists.

The following list contains applications which may ship with hardcoded icons:

Name | Find in the `.desktop` file | Replace by
------------ | ------------- | -------------
Nemo | `Icon=folder` | `Icon=nemo`
Gcolor2 | `Icon=/usr/share/pixmaps/gcolor2/gcolor2.xpm` | `Icon=gcolor2`
PyCharm | `Icon=/opt/pycharm-xxx/bin/pyCharm.png` | `Icon=pycharm`
Most intelliJ IDEs in general | `Icon=/opt/intellij-ide-name/bin/ide-name.png` | `Icon=ide-name`
Python 2.x | `Icon=/usr/share/pixmaps/python2.x.xpm` | `Icon=python2` or `Icon=python2.x`, as you wish
Python 3.x | `Icon=/usr/share/pixmaps/python3.x.xpm` | `Icon=python3` or `Icon=python3.x`, as you wish

Applications installed through Ubuntu Software (specifically on unbuntu 17.04+ or using snap) have a tendency to be hardcoded. The `.desktop` files for these apps can be found in `/var/lib/snapd/desktop/applications` and can be edited manually as mentioned above (assuming
`apps/scalable/foo-icon-name.svg` exists) .

This list is just what we have noticed, it might or might not be true on your
machine. If you found another candidate for the list, tell us!


 2. The icon may simply not have been themed yet.

If you can't find *anything* in this repository, and you're certain there are
no absolute paths in your `.desktop` file, open an issue and I'll try to fix
the problem. It's possible the icon has not yet been included. Feel free to
submit an [icon request](https://github.com/keeferrourke/la-capitaine-icon-theme/wiki/Submitting-Icon-Requests)
or a [pull request](https://github.com/keeferrourke/la-capitaine-icon-theme/wiki/Submitting-Pull-Requests).
If you want to submit a request, please be sure to read the wiki carefully, so
as not to waste my time.

### None of the icons are themed!
If some or all icons are not themed on your system, and you have correctly
applied La Capitaine as your icon theme, then you may have one or more of the
following problems.

 1. Your environment is not supported

Your desktop environment or system might not be supported.
Some older environments do not support SVG icons. The solution to this would be
to rasterize the vector graphics, however this is not officially planned.
See [supported environments](https://github.com/keeferrourke/la-capitaine-icon-theme/wiki#supported-environments)
on the wiki for more information.

 2. The icon theme installation is faulty or not accessible

First of all make sure that you have copied the `la-capitaine-icon-theme`
(name doesn't matter) folder into either `/usr/share/icons` or `~/.icons`, as
described in the [README](README.md).

If you have installed the theme correctly, then it should be visible in your
desktop environment's Appearance or Theme settings. This varies by DE.

If that doesn't work either, double-check if the icon theme folder was copied
properly to the correct location for a given user, or `/usr/share/icons` for a
system-wide installation.

You may also need to correct file permissions. Files (images, text documents,
etc.) should be `rw-r--r--` or `644` in octal, directories or inodes should be
`drwxr-xr-x` or `755` in octal.

# Questions?

Feel free to [contact me](https://krourke.org/contact).
