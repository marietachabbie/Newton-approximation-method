class Numeric
  def self.===(char)
    true if Integer(char) rescue false
  end
end

def calculate(polynomial, previous_value, n)
  f_x = solutions_for(polynomial, previous_value)[0]
  f_prime_x = solutions_for(polynomial, previous_value)[1]
  current_value = previous_value - (f_x / f_prime_x)
  output(current_value, polynomial, n)
end

def guess_first_value(polynomial)
  # do not forget to output it not to lose it in iteration
end

def iterate(polynomial, previous_value, n)
  while true
    input = gets.strip
    unless input == 'stop'
      n += 1
      calculate(polynomial, previous_value, n)
    else
      puts  'Bye!'
      return
    end
  end
end
