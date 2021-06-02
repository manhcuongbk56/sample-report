class DownloadAppReport

	def initialize(name)
		@totalAmount = 0
		@apps = []
	end

end

class ByApplicationReport

	def initialize(name)
		@name = name
		@amount = 0
		@os_downloads = []
	end

	def add_by_os_report(os_report)
		@amount += os_report.amount
		@os_downloads.push(os_report)
	end

end

class ByOsReport

	attr_reader :amount

	def initialize(os)
		@os = os
		@amount = 0
		@amount_in_days = []
	end


	def add_by_day_report(date, count)
	    @amount += count
	    if @next_date
	      until @next_date != date
	        @amount_in_days.push(ByDayReport.new(@next_date, 0))
	        @next_date = @next_date + 1.day
	      end
	    end
	    @amount_in_days.push(ByDayReport.new(date, count))
	    @next_date = date + 1.day
	end
	
end

class ByDayReport

	def initialize(date, amount)
		@date = date
		@amount = amount
	end
	
end