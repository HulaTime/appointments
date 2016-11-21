class CheckTime

	attr_reader :time

	def initialize(time)
		@time = time
		raise FORMAT_ERROR if bad_format?
		raise RANGE_ERROR if out_of_range?(time)
	end

	private

	ARG_ERROR = "Format: availability.rb hh:mm (24hr)"
	FORMAT_ERROR = "You did not enter a time\n#{ARG_ERROR}"
	RANGE_ERROR = "Sorry, bookings are only available between 08:00 and 15:00"

	def bad_format?
		t = time.split(':')
		t.map! do |n|
			return true if (n =~ /^[0-9]+$/) == nil
		end
		false
	end

	def find_seconds(t)
		time = t.split(":")
		secs = (time[0].to_i*3600) + (time[1].to_i*60) + time[2].to_i
	end

	def out_of_range?(time)
		secs = find_seconds(time)
		if secs < find_seconds('08:00') || secs > find_seconds('15:00')
			return true 
		end
	end
end