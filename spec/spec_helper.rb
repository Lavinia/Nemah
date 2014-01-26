$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

begin
  require 'byebug'
rescue LoadError
  puts 'byebug not available'
end

require 'nemah'
Dir['./spec/support/**/*.rb'].sort.each { |file| require file }
