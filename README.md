### What is this?
La Capitaine is an icon pack, designed to integrate with most desktop environments. The set of icons takes inspiration from the latest iterations of Mac OS X and Google's Material Design.

Every image in this theme is a _scalable vector graphic_ so it will look great at any size, on any screen. In my spare time, I work on adding new icons, updating old ones, and making this theme more complete. Since this theme is updated often, you should clone this git repository and pull regularly to make sure you're always up-to-date:

    cd ~/.icons
    git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git

Alternatively, there is an [AUR PKGBUILD](https://aur.archlinux.org/packages/la-capitaine-icon-theme-git) available, so if you're on Arch Linux, simply run:

    yaourt -S la-capitaine-icon-theme-git

and keep yourself on the _bleeding edge_ of this repo :)

### Configuration
La Capitaine comes with a configuration script which attempts to determine your distribution and desktop environment. Using this information, La Capitaine updates several system icons and icons used for mime-types.

For best integration with your distro/desktop environment, please run `./configure` and follow the prompts.

### Recommendations
La Capitaine looks best with a theme based on either Material Design or Mac OS X. Though I don't make GTK+ themes, some of my favourites are: [Flat-Plat](http://gnome-look.org/content/show.php/Flat-Plat?content=167704), [Adapta](https://github.com/tista500/Adapta), [Paper](https://snwh.org/paper/theme), [Arc](https://github.com/horst3180/arc-theme), and [Arc-OSX](http://gnome-look.org/content/show.php/Arc-OSX-themes?content=175536). Have fun, and happy theming!

### License
La Capitaine is a fork of the El General icon theme for the GNOME desktop with significant changes.
El General is in turn a fork of the Numix-circle icon theme.
As such, La Capitaine is a derivative work mostly licensed under the GPLv3.

The configuration script included here is written by me and licensed under the permissive MIT license.

See LICENSE and COPYING for more details.


### Icon Requests

If there's an icon that's missing in this project, feel free to [contact me](https://krourke.org/contact) or _open an issue_. Please provide me with the name of the application (and/or the name of the icon), the context of the icon (status, app, etc.), and in the case of desktop applications, a copy of the desktop file located at `/usr/share/applications/yourapplication.desktop` or `~/.local/share/applications/yourapplication.desktop`.

If at all possible, please provide a reference image for the original icon that is not included in this theme.

If you find that an application icon is not themed, but an icon appears in this project with the wrong (or a different) file name as specified in your x-desktop file, please let me know and _open an issue_.

### Roadmap
To-do:
 * Introduce more icon geometry; the mostly circular base is boring
 * Introduce subtler, softer gradients, lighting, and shadows
 * Change software store and management icons to something more original/generic
 * Add alternative status, action and other 16x16 icons for dark GTK+ themes

### Donations
I'm a poor computer science student in university, and I spend most of my free time working on this and other projects -- If you like this icon pack and want to support me or buy me a coffee, please feel free to [donate](https://paypal.me/keeferrourke):)

### Preview
![La Capitaine preview](https://cdn.rawgit.com/keeferrourke/la-capitaine-icon-theme/master/preview.svg)

