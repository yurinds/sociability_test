class ResultPrinter
  attr_reader :results_hash
  attr_accessor :result

  def initialize(results)
    @results_hash = results
    @result = ''
  end

  def set_result(all_points)
    @results_hash.each do |key, value|
      next unless key.include?(all_points)

      @result = value
    end
  end
end
