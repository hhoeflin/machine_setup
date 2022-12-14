# Where to look for game data files (found in 'bin'). Must be without trailing slashes!
DATADIR := .

# Include terminal support. Requires ncurses
TERMINAL := YES

# Include graphical support. Requires SDL2 and SDL2_image
GRAPHICS := NO
# Path to sdl2-config script
SDL_CONFIG := sdl2-config

# Select web brogue mode. Requires POSIX system.
WEBBROGUE := NO

# Enable debugging mode. See top of Rogue.h for features
DEBUG := NO

# Declare this is a release build
RELEASE := YES

# Configure the executable to run from a macOS .app bundle (only works in graphical mode)
MAC_APP := NO
