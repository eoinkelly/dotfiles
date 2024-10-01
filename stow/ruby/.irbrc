# Everything in here is run before each IRB session

# vim: ft=ruby

# Docs: https://github.com/ruby/irb

# Example of how to load a gem:
# https://github.com/michaeldv/awesome_print
# begin
#   require 'awesome_print'
#   AwesomePrint.irb! # Makes AwesomePrint the default formatter for IRB
# rescue LoadError => err
#   warn "Couldn't load Awesome Print: #{err}"
# end

# IRB.conf[:USE_PAGER] = false
# Reline::Face.config(:completion_dialog) do |conf|
#   conf.define :default, foreground: :white, background: :black
#   conf.define :enhanced, foreground: :black, background: :white
#   conf.define :scrollbar, foreground: :white, background: :black
# end

IRB.conf[:USE_AUTOCOMPLETE] = false
