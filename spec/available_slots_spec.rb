require 'available_slots'

Dir.chdir(File.dirname(__FILE__))

describe AvailableSlots do

	let(:slots) { described_class.new }
	json_file = File.read("../assets/availability_slots.json")

	it 'is initialized with all the available times' do
		expect(slots.available).to eq json_file
	end
	
end