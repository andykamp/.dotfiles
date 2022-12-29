# https://stackoverflow.com/questions/48956984/how-to-remap-escape-insert-mode-to-jk-in-fish-shell
function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert jk "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

end
