class Numeric
  def self.===(char)
    true if Integer(char) rescue false
  end
end

def check_if_symbol(element)
  case element
  when '='
    return 1
  when '+'
    return 2
  when '-'
    return 3
  else
    return 0
  end
end

def guess_intinial_value(polynomial)
  # do not forget to output it not to lose it in iteration

  # temporary solution below
  return 3.0
end

def iterate(polynomial, previous_value, n)
  while true
    input = gets.strip
    unless input == 'stop'
      n += 1
      current_value = find_current(polynomial, previous_value)
      unless current_value == 0.0
        output(n, current_value)
        previous_value = current_value
      else
        output_final(n, current_value)
        return
      end
    else
      puts  'Bye!'
      return
    end
  end
end

def approximate
  input = get_input()
  initial_guess = guess_intinial_value(input)
  iterate(input, initial_guess, 0)
end
