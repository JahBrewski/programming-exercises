require 'pry'
include Math


class GenericConverter
  def initialize(input_value)
    @input_value = input_value
  end

  def convert(converter)
    #raise NotImplementedError, 'You must implement the convert method'
    converter.convert
  end
end

class RadiansToDegreesConverter < GenericConverter
  def convert
    @input_value * (180/Math::PI)
  end
end

class DegreesToRadiansConverter < GenericConverter
  def convert
    @input_value * (Math::PI/180)
  end
end

CONVERTERS = { 
    "rd" => RadiansToDegreesConverter,
    "dr" => DegreesToRadiansConverter
  }

class GettingADegree



  def initialize
    #@input_file = File.open('input.txt')
  end

  def get_line_at_index(n)
    IO.readlines("input.txt")[n]
  end

  def input_unit_for_line_index(n)
    get_line_at_index(n)[-3]
  end

  def get_units_at_line_index(n)
    get_line_at_index(n)[-3..-2]
  end

  def get_input_value_at_line_index(n)
    line = get_line_at_index(n)
    /[0-9]*\.?[0-9]*/.match(line)[0].to_f
  end

  def output_unit_for_line_index(n)
    get_line_at_index(n)[-2]
  end

  def convert(input_value,input_unit,output_unit)
    #Converter.new(input_unit,output_unit).convert
    

  end

  def test
    puts "line 1"
    puts get_units_at_line_index(0)
    #GenericConverter.new(get_input_value_at_line_index(0)).convert(CONVERTERS[get_units_at_line_index(0)])
    puts CONVERTERS[get_units_at_line_index(0)].new(get_input_value_at_line_index(0)).convert

    puts "line 2"
    puts get_units_at_line_index(1)
    puts CONVERTERS[get_units_at_line_index(1)].new(get_input_value_at_line_index(1)).convert
    puts get_units_at_line_index(1)
  end
end

GettingADegree.new.test
