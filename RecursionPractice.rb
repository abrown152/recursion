# Is a given string a palindrome??
#
# def test(string)
#   string.downcase!
#   return true if string.length == 0 || string.length == 1
#   if string[0] == string[-1]
#     string[0] = ""
#     string[-1] = ""
#     test(string)
#   else
#     return false
#   end
# end

class Roman
  SYMBOL_VALUES = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  @arabic = 0

  def self.reverter(roman)
    roman.upcase!

    if roman.length == 0
      0
    elsif roman.length == 1
      @arabic += SYMBOL_VALUES[roman]
    else
      symbols = roman.chars
      symbol = symbols.shift
      next_symbol = symbols.first

      value = SYMBOL_VALUES[symbol]
      next_value = SYMBOL_VALUES[next_symbol]

      value *= -1 if next_value > value

      @arabic += value

      symbols = symbols.join
      value + Roman.reverter(symbols)
    end
    @arabic
  end
end
