# Everything in here is run before each IRB session

# https://github.com/michaeldv/awesome_print
begin
  require 'awesome_print'
  AwesomePrint.irb! # Makes AwesomePrint the default formatter for IRB
rescue LoadError => err
  warn "Couldn't load Awesome Print: #{err}"
end

# http://pablotron.org/software/wirble/README
begin
  require 'wirble'
  Wirble.init
  #Wirble.colorize # We let AwesomePrint do our coloring and formatting
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

begin
  require 'hirb'
  Hirb.enable :formatter => false # Let AwesomePrint do the formatting
  extend Hirb::Console # import the table and view methods
rescue LoadError => err
  warn "Couldn't load Hirb: #{err}"
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  ActionController::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

def vim(x)
  IO.popen( 'vim -c "setlocal filetype=yaml" -', 'w') do |io|
    io.puts x.to_yaml
  end
end

def less(x)
  IO.popen( 'less -', 'w') do |io|
    io.puts x.to_yaml
  end
end
