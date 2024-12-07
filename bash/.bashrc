
. /opt/asdf-vm/asdf.sh

. ~/.asdf/plugins/java/set-java-home.bash

export PATH="$PATH:/opt/asdf-vm/bin"

source ~/.dotfiles/bash/functions.sh
export QT_QPA_PLATFORMTHEME='gnome'

export TEMP=xterm-256color
eval "$(oh-my-posh init bash --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/cert.omp.json)"

