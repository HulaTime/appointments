class Availability

	attr_reader :time

	def initialize
		raise ARG_ERROR if ARGV.length != 1
		@time = ARGV
	end

	private

	ARG_ERROR = "Format: availability.rb hh:mm"

end