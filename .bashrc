#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi=nvim
alias pamcan=pacman

# -- Rust
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup
PS1='[\u@\h \W]\$ '
. "/home/acp/.config/cargo/env"
