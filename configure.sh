#!/bin/bash
# this script will update various icon symlinks based on your machine's
# reported distribution and desktop environment

# define global variables
DISTRO=$(lsb_release -si)
DISTRO=$(awk '{print tolower($0)}' <<< $DISTRO)
DISTRO=$(sed 's/\s+//g;s/[^a-z]//g' <<< $DISTRO)
DE=$XDG_CURRENT_DESKTOP
DE=$(awk '{print tolower($0)}' <<< $DE)
DE=$(sed 's/\s+//g;s/[^a-z]//g' <<< $DE)
distro_error=0
de_error=0
wd=$(pwd)


# set distributor logo based on distro or de
cd "$wd/places/scalable"
case $DISTRO in
    archlinux)
		ln -sf distributor-logo-archlinux.svg distributor-logo.svg 
		;;
    debian)
        ln -sf distributor-logo-debian.svg distributor-logo.svg 
		;;
    elementaryos)
	   	ln -sf distributor-logo-elementaryos.svg distributor-logo.svg 
		;;
    fedora)
	    ln -sf distributor-logo-fedora.svg distributor-logo.svg 
		;;
    gentoo)
        ln -sf distributor-logo-gentoo.svg distributor-logo.svg 
		;;
    korora)
        ln -sf distributor-logo-korora.svg distributor-logo.svg 
		;;
    linuxmint)
	    ln -sf distributor-logo-linuxmint.svg distributor-logo.svg 
		;;
    mageia) 
        ln -sf distributor-logo-mageia.svg distributor-logo.svg 
		;;
    manjaro)
        ln -sf distributor-logo-manjaro.svg distributor-logo.svg 
		;;
    opensuse)
        ln -sf distributor-logo-opensuse.svg distributor-logo.svg 
		;;
    ubuntu)
        ln -sf distributor-logo-ubuntu.svg distributor-logo.svg 
		;;
    *) 
		echo "Could not determine distribution logo."
       	distro_error=1 
		ln -sf distributor-logo-gnome.svg distributor-logo.svg
		;;
esac

read -p "Use distributor logo from desktop environment? [y/N] " yn
case $yn in
    [Yy]* ) 
        case $DE in
            gnome) 
                ln -sf distributor-logo-gnome.svg distributor-logo.svg 
                ;;
			unity) 
                ln -sf distributor-logo-unity.svg distributor-logo.svg 
                ;;
            xfce) 
                ln -sf distributor-logo-xfce.svg distributor-logo.svg 
                ;;
            lxde) 
                ln -sf distributor-logo-lxde.svg distributor-logo.svg 
                ;;
            kde) 
                ln -sf distributor-logo-kde.svg distributor-logo.svg 
                ;;
            *) 
                echo "Could not determine desktop environment... Using distribution logo."
                de_error=1
                ;;
        esac
        ;;
    * ) 
        if [ $distro_error -eq 0 ]; then
            echo "Using distribution logo." 
        elif [ $distro_error -eq 1] || [ $de_error -eq 1 ]; then
            echo "Could not determine distributor logo, you may need to set this manually in places/scalable/"
        fi
        ;;
esac

ln -sf distributor-logo.svg start-here.svg # fixes potentially broken link

cd "$wd"

ln -sf "$wd"/places/scalable/distributor-logo.svg "$wd"/apps/scalable/cs-desktop.svg
ln -sf "$wd"/places/scalable/distributor-logo.svg "$wd"/apps/scalable/applications-system.svg

echo "Updated distributor logo."

# update mimetypes based on distro and de
cd "$wd"/mimetypes/scalable

if [ "$DISTRO" == "opensuse" ]; then
	ln -sf application-x-rpm-opensuse.svg application-x-rpm.svg
elif [ "$DISTRO" == "fedora" ]; then
	ln -sf application-x-rpm-fedora.svg application-x-rpm.svg
elif [ "$DISTRO" == "debian" ]; then
	ln -sf application-x-deb-debian.svg application-x-deb.svg	
elif [ "$DISTRO" == "ubuntu" ]; then
	ln -sf application-x-deb-ubuntu.svg application-x-deb.svg
elif [ "$DISTRO" == "linuxmint" ]; then
	ln -sf application-x-deb-linuxmint.svg application-x-deb.svg
	ln -sf application-x-desktop-linuxmint.svg application-x-desktop.svg
else 
	ln -sf application-x-deb-debian.svg application-x-deb.svg
	ln -sf application-x-rpm-redhat.svg application-x-rpm.svg
fi

echo "Updated package archive icons."

if [ "$DE" == "gnome" ]; then
	ln -sf application-x-desktop-gnome.svg application-x-desktop.svg
elif [ "$DE" == "unity" ]; then
	ln -sf application-x-desktop-unity.svg application-x-desktop.svg
elif [ "$DE" == "lxde" ]; then
	ln -sf application-x-desktop-lxde.svg application-x-desktop.svg
elif [ "$DE" == "xfce" ]; then
	ln -sf application-x-desktop-xfce.svg application-x-desktop.svg
elif [ "$DE" == "kde" ]; then
	ln -sf application-x-desktop-kde.svg application-x-desktop.svg
fi

echo "Updated mimetype icons."

cd "$wd"

