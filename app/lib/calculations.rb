def reset_temp(values)
  values[:f_x_temp] = 0
  values[:f_prime_x_temp] = 0
end

def update_temp(values, element, x, operation)
  case element
  when Numeric
    case operation
    when 2
      values[:f_x_temp] += Integer(element)
    when 3
      values[:f_x_temp] -= Integer(element)
    end
  end

  coefficient = 1 #wroooong
  for j in 0..element.size - 1
    case element[j]
    when Numeric
      coefficient = Integer(element[j])
    when 'x'
      if element[j + 1] == '^'
        pow = Integer(element[j + 2])
        values[:f_x_temp] = (values[:f_x_temp] + coefficient * (x ** pow).truncate(6)).truncate(6)
        values[:f_prime_x_temp] = (values[:f_prime_x_temp] + coefficient * pow * (x ** (pow - 1)).truncate(6)).truncate(6)
        # return
      else
        values[:f_x_temp] = (values[:f_x_temp] + coefficient * x).truncate(6)
        values[:f_prime_x_temp] = (values[:f_prime_x_temp] + coefficient).truncate(6)
        # return
      end
    end

  end
end

def update_final(values, previous_element)
  case previous_element
  when '+', ''
    values[:f_x] = (values[:f_x] + values[:f_x_temp]).truncate(6)
    values[:f_prime_x] = (values[:f_prime_x] + values[:f_prime_x_temp]).truncate(6)
  when '-'
    values[:f_x] = (values[:f_x] - values[:f_x_temp]).truncate(6)
    values[:f_prime_x] = (values[:f_prime_x] - values[:f_prime_x_temp]).truncate(6)
  else
    # raise 'Something went wrong (2)'
  end
end

def calculate(polynomial, x)
  equation = polynomial.split(/ /)
  operation = -1
  values = {f_x: 0, f_prime_x: 0, f_x_temp: 0, f_prime_x_temp: 0}

  equation.each_with_index do | element, i |
    i = 0 ? previous_element = '' : previous_element = equation[i - 1]

    result = check_if_symbol(element)
    case result
    when 1
      return Array.[](values[:f_x], values[:f_prime_x])
    when 0
      # raise 'Something went wrong'
    else
      operation = result
    end
    update_temp(values, element, x, operation)
    update_final(values, previous_element)
    reset_temp(values)
  end
end

def find_current(polynomial, previous_value)
  results = calculate(polynomial, previous_value)
  f_x = results[0]
  f_prime_x = results[1]
  puts "previous: #{previous_value} f_x = #{f_x}, f_prime_x = #{f_prime_x}"
  current_value = (previous_value - (f_x / f_prime_x)).truncate(6)
  return current_value
end
