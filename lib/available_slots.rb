class AvailableSlots

	attr_reader :available

	def initialize
		@available = File.read("../assets/availability_slots.json")
	end

end