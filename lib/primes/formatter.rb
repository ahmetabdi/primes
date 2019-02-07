module Primes
  # Format the output into a pretty table
  class Formatter
    def self.run(x_axis, y_axis, multiplication_table)
      new(x_axis, y_axis, multiplication_table).run
    end

    attr_reader :x_axis, :y_axis, :multiplication_table

    def initialize(x_axis, y_axis, multiplication_table)
      @x_axis = x_axis
      @y_axis = y_axis
      @multiplication_table = multiplication_table
    end

    def run
      [
        header_output,
        spacer_output,
        table_output
      ]
    end

    def header_output
      ' ' * table_padding + ' |' + row_output(x_axis)
    end

    def spacer_output
      '-' * table_padding + '-+-' + ('-' * (x_axis.length * table_padding))
    end

    def table_output
      ''.tap do |string|
        multiplication_table.each_with_index do |row, index|
          string << "#{spacing(y_axis[index])} |" + row_output(row) + "\n"
        end
      end
    end

    def table_padding
      multiplication_table.flatten.max.to_s.length + 1
    end

    def spacing(value = 0)
      ' ' * (table_padding - value.to_s.length) + value.to_s
    end

    def row_output(row)
      row.map { |x| spacing(x) }.join
    end
  end
end
