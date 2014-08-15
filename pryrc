begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => err
  warn "Unable to load awesome_print #{err}"
end

# Load my custom helpers
load '~/.dotfiles/irb_snippets.rb'
load '~/.dotfiles/poke.rb'
