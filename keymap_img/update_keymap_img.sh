#!/bin/sh

echo 'Parsing ZMK keymap...'
keymap -c chocofi_keymap_config.yaml parse -c 10 -z ../config/chocofi.keymap --base-keymap chocofi_keymap_base.yaml > chocofi_keymap.yaml

echo '\n\nAdjusting keymap yaml...'
rm -rf chocofi_keymap.yamlupdated && ./keymap_img_adjuster.py chocofi_keymap.yaml

echo '\n\nDrawing keymap...'
keymap -c chocofi_keymap_config.yaml draw --select-layers abc '123' hjkl ext -k chocofi chocofi_keymap.yaml > chocofi_keymap.svg
