require 'bundler/setup'

ENVIROMENT = ENV['LIB_ENV'] || 'development'

Bundler.require(:default, ENVIROMENT)

require './lib/base'
require './lib/user'
require './lib/product'
require './lib/item'
require './lib/promotional_rule'
require './lib/checkout'
