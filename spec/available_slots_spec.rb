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

	close_appointment2 = {
      "time"=>"08:10:00",
      "slot_size"=>10,
      "doctor_id"=>1
   }

  updated_slot = {
        "time"=>"08:10:00",
        "slot_size"=>10,
        "doctor_id"=>1,
        "booked"=>[1]
     }

	it 'initialized with and parses the json file into a ruby hash' do
		expect(slots.parsed_file[0]['time']).to eq "08:00:00"
		expect(slots.parsed_file[3]['slot_size']).to eq 10
		expect(slots.parsed_file[15]['doctor_id']).to eq 2
	end

	it ':closest_appointment(argument) checks for closest slot to argument' do
		expect(slots.closest_appointment("08:39")).to eq close_appointment
		expect(slots.closest_appointment("08:10")).to eq close_appointment2
	end

	it ':book_slot(time) will update parsed file with a booking' do
		slots.book_slot("08:50")
		expect(slots.parsed_file[2]).to eq updated_slot
	end

end