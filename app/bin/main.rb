# considerինգ input is always with spaces between values and nothing between number and x
# considerինգ 0 < pow <= 9
# add or substract number in the end

require '../lib/formulas'
require '../lib/io'
require '../lib/utils'

# main
def approximate
  input = get_input
  # first_value = guess_first_value(input)
  # iterate(input, first_value, 0)
end

res = solutions_for('3x^3 + 6x = 0', 2)
puts "For f function '3x^3 + 6x = 0' and 2 as initial value, f(x) = #{res[0]}, f'(x) = #{res[1]} "
