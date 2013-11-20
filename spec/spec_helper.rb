$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nemah'
Dir['./spec/support/**/*.rb'].sort.each { |file| require file }
