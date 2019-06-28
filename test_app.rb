require_relative 'lib/test'
require_relative 'lib/result_printer'

current_path = File.dirname(__FILE__)
questions_path = current_path + '/data/questions.txt'
results_path = current_path + '/data/results.txt'

abort "Файл с результатами #{results_path} не найден." unless File.exist?(results_path)

file = File.new(results_path, 'r:UTF-8')
results = file.readlines
results.map!(&:strip)
file.close

abort "Файл с вопросами #{questions_path} не найден." unless File.exist?(questions_path)

file = File.new(questions_path, 'r:UTF-8')
questions = file.readlines
questions.map!(&:strip)
file.close

test = Test.new(questions)
printer = ResultPrinter.new(results)

test.start_test

test.show_questions

if test.aborted?
  puts 'Тест принудительно прекращён! Очень жаль...'
else

  printer.set_result(test.all_points)

  puts
  puts "Количество набранных баллов #{test.all_points}"
  puts 'Ваш результат:'
  puts printer.final_result

end
