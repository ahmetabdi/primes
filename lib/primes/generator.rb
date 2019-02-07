module Primes
  # Get first X prime numbers
  class Generator
    def self.run(count)
      new(count).run
    end

    attr_reader :count

    def initialize(count)
      @count = count
    end

    def run
      number = 2

      [].tap do |primes|
        while primes.length < count
          primes << number if prime?(number)
          number += 1
        end
      end
    end

    def prime?(number)
      i = 2

      while i <= number / 2
        return false if (number % i).zero?

        i += 1
      end

      true
    end
  end
end
