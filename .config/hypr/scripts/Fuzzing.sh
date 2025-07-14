#!/usr/bin/env zsh

local target
cd /
target=$(fzf --preview='bat --color=always {}') || exit 1
cd "$(dirname "$target")" && nvim .
