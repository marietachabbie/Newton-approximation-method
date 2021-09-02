# consider input is always with spaces between values and nothing between number and x
# consider 0 < pow <= 9
# add or substract number in the end

def output(current, polynomial, n)
  puts "x_#{n} = current, f(x) = #{polynomial}"
end

class Numeric
  def self.===(char)
    true if Integer(char) rescue false
  end
end

def solutions_for(polynomial, x)
  pol = polynomial.split(/ /)
  res = []
  f_x = 0
  f_prime_x = 0

  pol.each_with_index do | el, i |
    curr = el
    i = 0 ? prev = '' : prev = pol[i - 1]

    case curr
    when '='
      res.push(f_x).push(f_prime_x)
      return res
    when '+', '-'
      next
    else
      'Something went wrong (1)'
    end

    f_x_temp = 0
    f_prime_x_temp = 0
    pow = ''
    coef = ''

    for j in 0..el.size - 1
      case el[j]
      when Numeric
        coef += el[j]
      when 'x'
        if coef == ''
          coef = 1
        end
        if el[j + 1] == '^'
          f_x_temp += Integer(coef) * (x ** Integer(el[j + 2]))
          f_prime_x_temp += Integer(coef) * Integer(el[j + 2]) * (x ** (Integer(el[j + 2]) - 1))
        else
          f_x_temp += Integer(coef) * x
          f_prime_x_temp += Integer(coef)
        end
      end
    end

    case prev
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

def calculate(polynomial, previous_value, n)
  f_x = solutions_for(polynomial, previous_value)[0]
  f_prime_x = solutions_for(polynomial, previous_value)[1]
  current_value = previous_value - (f_x / f_prime_x)
  output(current_value, polynomial, n)
end

def get_input
  puts 'Type the polynomial here:'
  return gets.strip
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

# main
def approximate
  input = get_input
  # first_value = guess_first_value(input)
  # iterate(input, first_value, 0)
end

puts solutions_for('3x^3 + 6x = 0', 2)
