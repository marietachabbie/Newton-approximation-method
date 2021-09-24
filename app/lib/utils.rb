class Numeric
  def self.===(char)
    true if Integer(char) rescue false
  end
end

def guess_first_value(polynomial)
  # do not forget to output it not to lose it in iteration
end

def iterate(polynomial, previous_value, n)
  while true
    input = gets.strip
    unless input == 'stop'
      n += 1
      current_value = find_current(polynomial, previous_value)
      output(n, current_value)
      previous_value = current_value
    else
      puts  'Bye!'
      return
    end
  end
end

def approximate
  input = get_input()
  # guess_first_value
  iterate(input, 2.0, 0)
end
