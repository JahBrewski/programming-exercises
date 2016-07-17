    class WhatsInTheBag
    
      DEFAULT_DISTRIBUTION = { "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3, "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1, "_" => 2 } 
    
      def initialize(input_string)
        @input_string = input_string
        @distribution = DEFAULT_DISTRIBUTION
      end
    
      def run
        set_distribution
        sort_hash_by_values
        build_output_hash
        pretty_print
      end
    
      def set_distribution
        @input_string.each_char do |char|
          dist = @distribution[char] = @distribution[char] - 1
          raise "Invalid input. More #{char}'s have been taken from the bag than possible." if dist < 0
        end
      end
    
      def build_output_hash
        prev_val = 0
        output_hash = {}
    
        @distribution.each do |pair|
          current_char = pair[0]
          current_val  = pair[1]
    
          if prev_val == current_val
            output_hash[current_val].push(current_char)
          else
            output_hash[current_val] = []
            output_hash[current_val].push(current_char)
          end
    
          prev_val = current_val
        end
    
        output_hash.each do | key, value |
          output_hash[key] = output_hash[key].sort
        end
    
        @output_hash = output_hash
    
      end
    
      def pretty_print
        output = ""
        @output_hash.each do |key, value|
          output += "\n #{key}: #{value.join(', ')}"
        end
        puts output
      end
    
      def sort_hash_by_values
        @distribution = @distribution.sort_by { |letter, num| num }.reverse
      end
    
    end
    
    challenge1 = "PQAREIOURSTHGWIOAE_"
    challenge2 = "LQTOONOEFFJZT"
    challenge3 = "AXHDRUIOR_XHJZUQEE"
    
    WhatsInTheBag.new(challenge1).run
