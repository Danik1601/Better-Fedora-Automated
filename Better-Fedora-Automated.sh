#!/bin/bash

# Enable minimize and maximize buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# Install "Dash to Dock" by @michele_g
# busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s dash-to-dock@micxgx.gmail.com
# Disable "Dash to Dock" by @michele_g
# gnome-extensions disable "dash-to-dock@micxgx.gmail.com"

# Install "Dash to Panel" by @charlesg99 and @jderose9
# busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s dash-to-panel@jderose9.github.com
# Enable "Dash to Panel" by @charlesg99 and @jderose9
# gnome-extensions enable "dash-to-panel@jderose9.github.com"

# Add Flathub repository:
flatpak --system remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable Flathub repository:
flatpak --system remote-modify --enable flathub

# Disable Fedora repository:
flatpak --system remote-modify --disable fedora

# Remove all applications and runtimes:
flatpak --system uninstall --all -y

# Install back Fedora default applications from Flathub:
flatpak install flathub -y org.fedoraproject.MediaWriter &&
flatpak install flathub -y org.gnome.Calculator &&
flatpak install flathub -y org.gnome.Calendar &&
flatpak install flathub -y org.gnome.Characters &&
flatpak install flathub -y org.gnome.Connections &&
flatpak install flathub -y org.gnome.Contacts &&
flatpak install flathub -y org.gnome.Evince &&
flatpak install flathub -y org.gnome.Extensions &&
flatpak install flathub -y org.gnome.FileRoller &&
flatpak install flathub -y org.gnome.Logs &&
flatpak install flathub -y org.gnome.Maps &&
flatpak install flathub -y org.gnome.NautilusPreviewer &&
flatpak install flathub -y org.gnome.TextEditor &&
flatpak install flathub -y org.gnome.Weather &&
flatpak install flathub -y org.gnome.baobab &&
flatpak install flathub -y org.gnome.clocks &&
flatpak install flathub -y org.gnome.eog &&
flatpak install flathub -y org.gnome.font-viewer &&

# Install Flatpak apps
flatpak install flathub -y com.google.Chrome &&
flatpak install flathub -y com.anydesk.Anydesk &&
flatpak install flathub -y com.transmissionbt.Transmission &&
flatpak install flathub -y org.videolan.VLC &&
flatpak install flathub -y com.obsproject.Studio &&
flatpak install flathub -y org.libreoffice.LibreOffice &&
flatpak install flathub -y org.gnome.SimpleScan &&
flatpak install flathub -y org.gnome.Firmware &&
flatpak install flathub -y org.gnome.Connections &&
flatpak install flathub -y org.gnome.Boxes &&
flatpak install flathub -y org.gnome.Extensions &&
flatpak install flathub -y com.mattjakeman.ExtensionManager &&
flatpak install flathub -y io.github.realmazharhussain.GdmSettings &&
flatpak install flathub -y com.github.tchx84.Flatseal &&
flatpak install flathub -y com.usebottles.bottles &&
flatpak install flathub -y io.github.prateekmedia.appimagepool &&
flatpak install flathub -y org.telegram.desktop &&
flatpak install flathub -y com.visualstudio.code &&
flatpak install flathub -y io.podman_desktop.PodmanDesktop &&
flatpak install flathub -y com.parsecgaming.parsec

# Enable PWA support in Google Chrome
flatpak override --user \
  --filesystem=~/.local/share/applications:create \
  --filesystem=~/.local/share/icons:create \
 com.google.Chrome

# Set Google Chrome as the default web browser
xdg-settings set default-web-browser com.google.Chrome.desktop

# Set up templates
touch ~/Templates/new.txt

# Apply latest updates
if [[ "$VARIANT_ID" == "silverblue" || "kinoite" || "sericea"]]
   then
      rpm-ostree update
   else
      exit
fi
