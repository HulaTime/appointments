require 'available_slots'

describe AvailableSlots do

	let(:slots) { described_class.new }
	
	root_path = File.join(File.dirname(__FILE__), '..')
	json_path = "/assets/availability_slots.json"
	json_file = File.read(root_path + json_path)

	it 'is initialized with all the available times' do
		expect(slots.raw_file).to eq json_file
	end

	it 'should parse the json file into a ruby hash' do
		expect(slots.parsed_file[0]['time']).to eq "08:00:00"
		expect(slots.parsed_file[3]['slot_size']).to eq 10
		expect(slots.parsed_file[15]['doctor_id']).to eq 2
	end

end