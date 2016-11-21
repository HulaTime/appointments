require 'available_slots'

describe AvailableSlots do

	let(:slots) { described_class.new }
	
	root_path = File.join(File.dirname(__FILE__), '..')
	json_path = "/assets/availability_slots.json"
	json_file = File.read(root_path + json_path)

	close_appointment = {
        "time"=>"08:40:00",
        "slot_size"=>10,
        "doctor_id"=>1
     }

	it 'initialized with and parses the json file into a ruby hash' do
		expect(slots.parsed_file[0]['time']).to eq "08:00:00"
		expect(slots.parsed_file[3]['slot_size']).to eq 10
		expect(slots.parsed_file[15]['doctor_id']).to eq 2
	end

	it ':closest_appointment(argument) checks for closest slot to argument' do
		expect(slots.closest_appointment("08:39")).to eq close_appointment
	end

	it ':book_slot(time) will update parsed file with a booking' do
		5.times { slots.book_slot("08:39") }
		expect(slots.bookings[1]).to include close_appointment
		expect(slots.bookings[2]).to include close_appointment
		expect(slots.bookings[1].length).to eq 1
		expect(slots.bookings[2].length).to eq 1
	end

end