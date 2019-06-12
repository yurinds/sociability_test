require_relative 'test'
require_relative 'result_printer'

test = Test.new
printer = ResultPrinter.new

test.start_test

test.show_questions

if test.aborted?
  puts 'Тест принудительно прекращён! Очень жаль...'
else
  printer.show_result(test.all_points)
end
