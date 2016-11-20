class Input

	attr_reader :time

	def initialize
		if ARGV.length != 1 || bad_format?
			puts FORMAT_ERROR 
			abort
		end
		@time = ARGV
	end

	private

	ARG_ERROR = "Format: availability.rb hh:mm"
	FORMAT_ERROR = "Please provide a time to check.\n#{ARG_ERROR}"

	def bad_format?
		split_time = ARGV[0].split(':')
		return true if split_time.length != 2
		split_time.each do |n|
			return true if n.to_i == 0 && n != '0'
		end
		false
	end

end