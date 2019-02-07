module Primes
  # Generate a multiplication table of prime numbers of a given count
  class MultiplicationTable
    def self.generate(count)
      new(count).generate
    end

    attr_reader :count, :x_axis, :y_axis

    def initialize(count)
      @count = count
      @x_axis = Generator.run(count)
      @y_axis = Generator.run(count)
    end

    def multiplication_table
      return [] if count <= 0

      [].tap do |table|
        x_axis.each do |x|
          y_axis.each do |y|
            table << x * y
          end
        end
      end.each_slice(count).to_a
    end

    def generate
      Formatter.run(x_axis, y_axis, multiplication_table)
    end
  end
end
