#!/bin/sh

# compile-hfst-fsts.sh

# Script to compile core FSTs from LEXC and XFSCRIPT source code
# Output: HFST

echo 'Concatenating LEXC source files into: lexicon.lexc.' ;

cat \
./defs/multichars.lexc \
./defs/root.lexc \
./affixes/verb_prefixes.lexc \
./stems/verb_stems.lexc \
./affixes/verb_suffixes.lexc \
> lexicon.lexc

echo 'Compiling HFSTs.' ;

hfst-xfst -F scripts/hfst_compile.xfscript

echo 'Finished.';

