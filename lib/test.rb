class Test
  attr_reader :questions, :answers, :valid_answers, :end_test, :abort, :number_questions, :current_question

  END_TEST = '9'.freeze

  def initialize(questions)
    @questions = questions
    @number_questions = @questions.size
    @current_question = 0

    # в хэше храню допустимые ответы и количество очков за ответ
    # 1 - «да» – 2 очка, 3 - «иногда» – 1 очко, 2 - «нет» – 0
    @valid_answers = { '1' => 2, '3' => 1, '2' => 0 }

    # массив всех ответов пользователя
    @answers = []

    # был ли тест принудительно завершен
    @abort = false
  end

  def force_interrupt
    END_TEST
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

  def end_test?
    @number_questions == @current_question
  end

  def next_question
    @questions[@current_question]
  end

  def response_processing(answer)
    if interrupted?(answer)
      # тест принудительно завершен
      @abort = true
    else
      # добавляю в массив очки за ответ
      @answers << @valid_answers[answer]
      @current_question += 1
    end
  end

  # тест был принудительно прерван?
  def aborted?
    @abort
  end

  # показывает начало теста
  def show_start_test
    text_start = <<~START
    Вашему вниманию предлагается несколько простых вопросов
    Отвечайте быстро, однозначно: «да», «нет», «иногда» (вводите 1, 2, 3 соответственно, для выхода - 9).
    Нажмите Enter, чтобы продолжить...
    START

    text_start
  end
end
