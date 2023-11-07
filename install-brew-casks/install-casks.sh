#!/bin/zsh

# extract each line in the file into the variable "line" and run for loop
for line in "${(@f)"$(<./cask-list.txt)"}"
{
  brew install $line
}

