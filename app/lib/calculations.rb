


def calculate(polynomial, x)
  equation = polynomial.split(/ /)
  results = []
  f_x = 0
  f_prime_x = 0

  equation.each_with_index do | element, i |
    i = 0 ? previous = '' : previous = equation[i - 1]

    case element
    when '='
      results.push(f_x).push(f_prime_x)
      return results
    when '+', '-'
      next
    else
      'Something went wrong (1)'
    end

    f_x_temp = 0
    f_prime_x_temp = 0
    pow = ''
    coefficient = ''

    for j in 0..element.size - 1
      case element[j]
      when Numeric
        coefficient += element[j]
      when 'x'
        if coefficient == ''
          coefficient = 1
        end
        if element[j + 1] == '^'
          f_x_temp += Integer(coefficient) * (x ** Integer(element[j + 2]))
          f_prime_x_temp += Integer(coefficient) * Integer(element[j + 2]) * (x ** (Integer(element[j + 2]) - 1))
          # need to break
        else
          f_x_temp += Integer(coefficient) * x
          f_prime_x_temp += Integer(coefficient)
          # need to break
        end
      end
    end

    case previous
    when '+', ''
      f_x += f_x_temp
      f_prime_x += f_prime_x_temp
    when '-'
      f_x -= f_x_temp
      f_prime_x -= f_prime_x_temp
    else
      puts 'Something went wrong (2)'
    end
    f_x_temp = 0
    f_prime_x_temp = 0
  end
end

def find_current(polynomial, previous_value)
  results = calculate(polynomial, previous_value)
  f_x = results[0]
  f_prime_x = results[1]
  current_value = previous_value - (f_x / f_prime_x)
  return current_value 
end
