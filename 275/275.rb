require 'pry'

class SplurthianChemistryValidator

  def initialize
    @element_name = ARGV[0].downcase
    @proposed_symbol = ARGV[1].downcase
  end

  def run
    if valid_name?
      puts "valid"
    else
      puts "invalid"
    end
  end

  private

  def valid_name?
    valid = true
    first_char = @proposed_symbol[0]
    second_char = @proposed_symbol[1]

    # Check if length is valid
    valid = valid && (@proposed_symbol.length == 2)

    # Check if first char symbol is in the element name
    valid = valid && @element_name.include?(first_char)

    # Check if second char symbol is in the element name
    valid = valid && @element_name.include?(second_char)

    # Check if the first char symbol comes before the second char symbol in the
    # element name
    valid = valid && (@element_name.index(first_char) < @element_name.rindex(second_char))

    # If both chars are the same, ensure there are at least two occurences of
    # the char in the element name
    
    if (first_char == second_char)
      valid = valid && (@element_name.count(first_char) >= 2)
    end

    return valid
  end
end

SplurthianChemistryValidator.new.run
