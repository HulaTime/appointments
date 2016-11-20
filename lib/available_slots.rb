class AvailableSlots

	attr_reader :available

	def initialize
		@available = File.read(ROOT_PATH + "/assets/availability_slots.json")
	end

	private

	ROOT_PATH = File.join(File.dirname(__FILE__), '..')

end