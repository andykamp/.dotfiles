# Place this in your Fish functions folder to make it available immediately
# e.g. ~/.config/fish/functions/envsource.fish
#
# Usage: envsource <path/to/env>

function envsource
  for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] $item[2]
  end
end

