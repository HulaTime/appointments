require 'json'

class AvailableSlots

	attr_reader :parsed_file

	def initialize
		raw_file = File.read(ROOT_PATH + "/assets/availability_slots.json")
		@parsed_file = JSON.parse(raw_file)['availability_slots']
	end

	def closest_appointment(arg)
	end

	private

	ROOT_PATH = File.join(File.dirname(__FILE__), '..')

end