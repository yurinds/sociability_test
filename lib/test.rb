class Test
  attr_reader :questions, :answers, :valid_answers, :end_test, :abort

  END_TEST = '9'.freeze

  def initialize(questions)
    @questions = questions

    # в хэше храню допустимые ответы и количество очков за ответ
    # 1 - «да» – 2 очка, 3 - «иногда» – 1 очко, 2 - «нет» – 0
    @valid_answers = { '1' => 2, '3' => 1, '2' => 0 }

    # массив всех ответов пользователя
    @answers = []

    # был ли тест принудительно завершен
    @abort = false
  end

  def all_points
    # суммирую элементы массива
    @answers.sum
  end

  def answer_valid?(answer)
    !@valid_answers[answer] && answer != END_TEST
  end

  def interrupted?(answer)
    answer == END_TEST
  end

  # последовательно выводит вопросы пользователю
  def show_questions
    @questions.each.with_index(1) do |question, index|
      puts "#{index}. #{question} "

      answer = ''

      # записываю ответ при вводе 1, 2 или 3, прерываю тест при вводе 9
      while answer_valid?(answer)
        puts 'Введите ваш ответ: 1 - "Да", 2 - "Нет", 3 - "Иногда" ' \
             "или #{END_TEST} для принудительного завершения..."
        answer = STDIN.gets.strip.downcase
      end

      if interrupted?(answer)
        # тест принудительно завершен
        @abort = true
        break
      else
        # добавляю в массив очки за ответ
        @answers << @valid_answers[answer]
      end
    end
  end

  # тест был принудительно прерван?
  def aborted?
    @abort
  end

  # показывает начало теста
  def start_test
    puts 'Вашему вниманию предлагается несколько простых вопросов. ' \
         'Отвечайте быстро, однозначно: «да», «нет», «иногда» (вводите 1, 2, 3 соответственно, ' \
         'для выхода - 9).'
    print 'Нажмите Enter, чтобы продолжить...'
    gets
  end
end
