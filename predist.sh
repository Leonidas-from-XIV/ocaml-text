#!/bin/sh

# Generate CHANGES.darcs
[ -d "$DARCS_REPO" ] && darcs changes --repodir "$DARCS_REPO" > CHANGES.darcs

# Build the user manual for release
cd manual
make manual.pdf
# Remove intermediate files
make clean-aux
cd ..

# The makefile is only used to create the tarball
rm -f Makefile

# Add oasis stuff:
OASIS setup

# Remove this file
rm -f predist.sh
