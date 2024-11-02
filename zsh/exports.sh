. ~/.asdf/plugins/java/set-java-home.zsh

export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/bin/go/bin:$PATH"

export ANDROID_HOME="$HOME/Android/Sdk"
# export ANDROID_AVD_HOME="$HOME/.config/.android/avd"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_RUNTIME_DIR=/run/user/$(id -u)

export XKB_DEFAULT_LAYOUT="us,gr"
export XKB_DEFAULT_OPTIONS="grp:alt_shift_toggle"

export TERM="xterm-256color"
export EDITOR="nano"
export NODE_OPTIONS="--max-old-space-size=8192"
