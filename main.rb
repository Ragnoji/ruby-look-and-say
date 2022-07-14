# encoding: utf-8
class NumberSequence

  # Инициализация атрибута count
  def initialize
    @count = 0
  end

  # Задание длины последовательности
  def get_input
    puts 'Enter the number of elements in sequence'
    @count = gets.to_i - 1
  end

  # Получение следующей строки последовательности по той, которая передана в функцию
  def get_next_line(line)
    newline = ''
    occurrence = 0
    last_char = line[0]
    line.each_char do |char|
      if char != last_char
        newline = "#{newline}#{occurrence}#{last_char}"
        occurrence = 0
        last_char = char
      end
      occurrence += 1
    end

    # Присоединение недобавленного last_char'а в return
    "#{newline}#{occurrence}#{last_char}"
  end

  def print_output
    out = Array.new(@count,String)
    out[0] = '1'

    (1..@count).each do |n|
      out[n] = get_next_line(out[n-1])
    end

    puts out.join("\n") # вывод результата
  end
end


seq = NumberSequence.new

seq.get_input

seq.print_output