#!/bin/perl
# Display a warning if the terminal does not support 256 colors                                                    
  term_colors                                                                                                 
  term_colors=$(tput colors)                                                                                        
  if (( term_colors < 256 )); then                                                                                  
    print -P "%F{red}WARNING!%f Your terminal supports less than 256 colors!"                                       
    print -P "You should put: %F{blue}export TERM=\"xterm-256color\"%f in your \~\/.zshrc"                          
  fi                                                                                                                
