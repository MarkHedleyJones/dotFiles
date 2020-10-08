#!/bin/bash

as_desktop=false

# Determine if the laptop is plugged into an external monitor
path_monitor=/sys/class/drm/card0-DP-1

if [[ -d ${path_monitor} ]] && [[ "$(cat ${path_monitor}/enabled)" == "enabled" ]]; then
  as_desktop=true
fi

if [[ "${as_desktop}" == true ]]; then
  # Change monitors
  if [[ -f ~/bin/set_monitor_as_desktop.sh ]]; then
    set_monitor_as_desktop.sh
    i3-msg restart
  fi

  sleep 0.5

  # Set audio to HDMI
  pacmd set-card-profile 0 output:hdmi-stereo

  # Update fcitx with settings
  if [[ -d ~/.config/fcitx ]]; then
    cp ~/repos/dotFiles/fcitx/profile_desktop ~/.config/fcitx/profile
    fcitx --replace
  fi

#   # Set keyboard layout to QWERTY (maybe not necessary)
#   cat > /etc/default/keyboard <<EOF
# XKBMODEL="pc105"
# XKBLAYOUT="us"
# XKBVARIANT=""
# XKBOPTIONS="shift:both_capslock"
# BACKSPACE="guess"
# EOF
#   udevadm trigger --subsystem-match=input --action=change
else
  # Change monitors
  if [[ -f ~/bin/set_monitor_as_laptop.sh ]]; then
    set_monitor_as_laptop.sh
    i3-msg restart
  fi

  sleep 0.5

  # Set audio to internal speakers
  pacmd set-card-profile 0 output:analog-stereo

  # Update fcitx with settings
  if [[ -d ~/.config/fcitx ]]; then
    cp ~/repos/dotFiles/fcitx/profile_laptop ~/.config/fcitx/profile
    fcitx --replace
  fi

#   # Set keyboard layout to Colemak (maybe not necessary)
#   cat > /etc/default/keyboard <<EOF
# XKBMODEL="pc105"
# XKBLAYOUT="us"
# XKBVARIANT="colemak"
# XKBOPTIONS="shift:both_capslock"
# BACKSPACE="guess"
# EOF
#   udevadm trigger --subsystem-match=input --action=change
fi

# Put the user on workspace 1
i3-msg workspace 1
