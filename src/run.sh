#!/bin/sh

export DISPLAY=:20

# Remove possible old screen data.
rm -f /tmp/*
# Setup screen
Xvfb :20 -screen 0 1366x768x16 &
x11vnc -passwd $VNC_PASS -display :20 -N -forever &
# Install python app.
python /app/setup.py install --user &&
# Run the app
python snake