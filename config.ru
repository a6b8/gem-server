# require 'rubygems'
# require 'bundler'

# Bundler.require

# require './index'
# run Invoice


require 'rubygems'
require 'bundler'

Bundler.require
require './lib/write_invoice/index'

app = Rack::URLMap.new( '/invoice' => Invoice )
run app