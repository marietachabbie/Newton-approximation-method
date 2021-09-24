def reset_temp(values)
  values[:f_x_temp] = 0
  values[:f_prime_x_temp] = 0
end

def update_temp(values, element, x)
  coefficient = 1

  for j in 0..element.size - 1
    case element[j]
    when Numeric
      coefficient = Integer(element[j])
    when 'x'
      if element[j + 1] == '^'
        pow = Integer(element[j + 2])
        values[:f_x_temp] += coefficient * (x ** pow)
        values[:f_prime_x_temp] += coefficient * pow * (x ** (pow - 1))
        return
      else
        values[:f_x_temp] += coefficient * x
        values[:f_prime_x_temp] += coefficient
        return
      end
    end
  end
end

def update_final(values, previous_element)
  case previous_element
  when '+', ''
    values[:f_x] += values[:f_x_temp]
    values[:f_prime_x] += values[:f_prime_x_temp]
  when '-'
    values[:f_x] -= values[:f_x_temp]
    values[:f_prime_x] -= values[:f_prime_x_temp]
  else
    # raise 'Something went wrong (2)'
  end
end

def check_if_symbol(element)
  case element
  when '='
    return 1
  when '+', '-'
    return 2
  else
    return 0
  end
end

def calculate(polynomial, x)
  equation = polynomial.split(/ /)
  values = {f_x: 0, f_prime_x: 0, f_x_temp: 0, f_prime_x_temp: 0}

  equation.each_with_index do | element, i |
    i = 0 ? previous_element = '' : previous_element = equation[i - 1]

    result = check_if_symbol(element)
    case result
    when 1
      return Array.[](values[:f_x], values[:f_prime_x])
    when 0
      # raise 'Something went wrong'
    end
    update_temp(values, element, x)
    update_final(values, previous_element)
    reset_temp(values)
  end
end

def find_current(polynomial, previous_value)
  results = calculate(polynomial, previous_value)
  f_x = results[0]
  f_prime_x = results[1]
  current_value = previous_value - (f_x / f_prime_x)
  return current_value 
end
