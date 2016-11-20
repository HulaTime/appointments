class Availability

	attr_reader :time

	def initialize
		raise ARG_ERROR if ARGV.length != 1
		raise FORMAT_ERROR if bad_format?
		@time = ARGV
	end

	private

	ARG_ERROR = "Format: availability.rb hh:mm"
	FORMAT_ERROR = "You did not enter a time\n#{ARG_ERROR}"

	def bad_format?
		split_time = ARGV[0].split(':')
		return true if split_time.length != 2
		split_time.each do |n|
			return true if n.to_i == 0 && n != '0'
		end
		false
	end

end