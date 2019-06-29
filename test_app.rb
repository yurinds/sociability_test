require_relative 'lib/test'
require_relative 'lib/result'

current_path = File.dirname(__FILE__)
questions_path = current_path + '/data/questions.txt'
results_path = current_path + '/data/results.txt'

abort "Файл с вопросами #{questions_path} не найден." unless File.exist?(questions_path)
abort "Файл с результатами #{results_path} не найден." unless File.exist?(results_path)

questions = File.readlines(questions_path, chomp: true)
results = File.readlines(results_path, chomp: true)

test = Test.new(questions)
result = Result.new(results)

puts test.show_start_test
gets

force_interrupt_key = test.force_interrupt
index = 1
until test.end_test? || test.aborted?
  question = test.next_question
  puts "#{index}. #{question} "

  answer = ''
  while test.answer_valid?(answer)
    puts 'Введите ваш ответ: 1 - "Да", 2 - "Нет", 3 - "Иногда" ' \
         "или #{force_interrupt_key} для принудительного завершения..."
    answer = STDIN.gets.strip.downcase
  end

  test.response_processing(answer)

  index += 1
end

if test.aborted?
  puts 'Тест принудительно прекращён! Очень жаль...'
else
  result.set_result(test.all_points)

  puts
  puts "Количество набранных баллов #{test.all_points}"
  puts 'Ваш результат:'
  puts result.final_result
end
