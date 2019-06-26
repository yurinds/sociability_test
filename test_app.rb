require_relative 'lib/test'
require_relative 'lib/result_printer'
require_relative 'data/constants'

test = Test.new(QUESTIONS)
printer = ResultPrinter.new(RESULTS)

test.start_test

test.show_questions

if test.aborted?
  puts 'Тест принудительно прекращён! Очень жаль...'
else

  printer.set_result(test.all_points)

  puts
  puts "Количество набранных баллов #{test.all_points}"
  puts 'Ваш результат:'
  puts printer.result

end
