require_relative 'primes/version'
require_relative 'primes/multiplication_table'
require_relative 'primes/formatter'
require_relative 'primes/generator'

require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: primes.rb [options]'

  opts.on('-c', '--count I', Integer, 'Count of primes') do |v|
    options[:count] = v
  end
end.parse!

if options.key?(:count)
  puts Primes::MultiplicationTable.generate(options[:count])
end
