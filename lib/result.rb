class Result
  attr_reader :results
  attr_accessor :final_result

  def initialize(results)
    @results = results
    @final_result = ''
  end

  def set_result(all_points)
    @final_result = case all_points
                    when (30..32) then @results[0]
                    when (25..29) then @results[1]
                    when (19..24) then @results[2]
                    when (14..18) then @results[3]
                    when (9..13) then @results[4]
                    when (4..9) then @results[5]
                    else
                      @results[6]
    end
  end
end
