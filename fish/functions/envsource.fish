# Place this in your Fish functions folder to make it available immediately
# e.g. ~/.config/fish/functions/envsource.fish
#
# Usage: envsource <path/to/env>

function envsource
  for line in (cat $argv | grep -v '^#' | grep -v '^\s*$')
    set item (string split -m 1 '=' $line)
    echo $item[1]
    echo $item[2]
    set -gx $item[1] $item[2]
    echo "Exported key $item[1]"
  end
end

