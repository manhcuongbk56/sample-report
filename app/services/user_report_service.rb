class UserReportService
  class << self
    def get_new_register(start_time, end_time)
      counts = User.where('created_at >= ? AND created_at <= ?', start_time.beginning_of_day, end_time.beginning_of_day).group("DATE_TRUNC('day', created_at)")
                   .order("DATE_TRUNC('day', created_at) DESC").count()
      counting_report = CountingReport.new
      counts.each {|date, count| counting_report.add_in_day_count(date, count)}
      counting_report
    end
  end
end