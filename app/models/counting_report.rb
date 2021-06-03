class CountingReport

  def initialize
    @total = 0
    @histogram = []
  end

  def add_in_day_count(date, count)
    @total += count
    if @next_date
      until @next_date == date
        @histogram.push(InDayCount.new(@next_date, 0))
        @next_date = @next_date + 1.day
      end
    end
    @histogram.push(InDayCount.new(date, count))
    @next_date = date + 1.day
  end

  def to_response
    as_json(except: %w[next_date a])
  end

end


class InDayCount
  def initialize(date, count)
    @date = date.strftime('%FT%H:%MZ')
    @count = count
  end
end