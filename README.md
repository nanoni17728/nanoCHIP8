# Nano's CHIP-8
Learning to make a runtime in C++. "Modern" and Functional minded. You can
follow my adventures in the [devlog/](devlog/) directory!

## Build
Right now I only build the repository via the nix packages manager. I invite
you to install it, run `nix develop` when entering the directory, and do
the usual `cmake -S . -B build/` and `cmake --build build/`. You also need
to pull the imgui git repository with `git submodule --init imgui/` as I
have still to write code for CMake to do it automatically.

## Licence
This is free and unencumbered software released into the public domain. Use
it however you want, check the [UNLICENSE](UNLICENSE.md) file for more
informations.
