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
