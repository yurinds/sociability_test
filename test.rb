class Test
  attr_reader :questions, :answers, :valid_answers, :end_test, :is_abort

  def initialize
    @questions = [
      'Вам предстоит ординарная или деловая встреча. Выбивает ли Вас ее ожидание из колеи?',
      'Вызывает ли у Вас смятение и неудовольствие поручение выступить с докладом, сообщением, информацией на каком-либо совещании, собрании или тому подобном мероприятии?',
      'Не откладываете ли Вы визит к врачу до последнего момента?',
      'Вам предлагают выехать в командировку в город, где Вы никогда не бывали. Приложите ли Вы максимум усилий, чтобы избежать этой командировки?',
      'Любите ли Вы делиться своими переживаниями с кем бы то ни было?',
      'Раздражаетесь ли Вы, если незнакомый человек на улице обратится к Вам с просьбой (показать дорогу, назвать время, ответить на какой-то вопрос)?',
      'Верите ли Вы, что существует проблема "отцов и детей" и что людям разных поколений трудно понимать друг друга?',
      'Постесняетесь ли Вы напомнить знакомому, что он забыл Вам вернуть деньги, которые занял несколько месяцев назад?',
      'В ресторане либо в столовой Вам подали явно недоброкачественное блюдо. Промолчите ли Вы, лишь рассерженно отодвинув тарелку?',
      'Оказавшись один на один с незнакомым человеком, Вы не вступите с ним в беседу и будете тяготиться, если первым заговорит он. Так ли это?',
      'Вас приводит в ужас любая длинная очередь, где бы она ни была (в магазине, библиотеке, кассе кинотеатра). Предпочитаете ли Вы отказаться от своего намерения или встанете в хвост и будете томиться в ожидании?',
      'Боитесь ли Вы участвовать в какой-либо комиссии по рассмотрению конфликтных ситуаций?',
      'У Вас есть собственные сугубо индивидуальные критерии оценки произведений литературы, искусства, культуры и никаких чужих мнений на этот счет Вы не приемлете. Это так?',
      'Услышав где-либо в кулуарах высказывание явно ошибочной точки зрения по хорошо известному Вам вопросу, предпочитаете ли Вы промолчать и не вступать в разговор?',
      'Вызывает ли у Вас досаду чья-либо просьба помочь разобраться в том или ином служебном вопросе или учебной теме?',
      'Охотнее ли Вы излагаете свою точку зрения (мнение, оценку) в письменной форме, чем в устной?'
    ]

    # в хэше храню допустимые ответы и количество очков за ответ
    # 1 - «да» – 2 очка, 3 - «иногда» – 1 очко, 2 - «нет» – 0
    @valid_answers = { '1' => 2, '3' => 1, '2' => 0 }

    # массив всех ответов пользователя
    @answers = []

    # был ли тест принудительно завершен
    @is_abort = false
  end

  def all_points
    # суммирую элементы массива
    @answers.sum
  end

  # последовательно выводит вопросы пользователю
  def show_questions
    @questions.each.with_index(1) do |question, index|
      puts "#{index}. #{question} "

      answer = ''

      # записываю ответ при вводе 1, 2 или 3, прерываю тест при вводе 9
      while !@valid_answers[answer] && answer != '9'
        puts 'Введите ваш ответ: 1 - "Да", 2 - "Нет", 3 - "Иногда" или "9" для принудительного завершения...'
        answer = gets.strip.downcase
      end

      if answer == '9'
        # тест принудительно завершен
        @is_abort = true
        break
      else
        # добавляю в массив очки за ответ
        @answers << @valid_answers[answer]
      end
    end
  end

  # тест был принудительно прерван?
  def aborted?
    @is_abort
  end

  # показывает начало теста
  def start_test
    puts 'Вашему вниманию предлагается несколько простых вопросов. Отвечайте быстро, однозначно: «да», «нет», «иногда» (вводите 1, 2, 3 соответственно, для выхода - 9).'
    print 'Нажмите Enter, чтобы продолжить...'
    gets
  end
end
