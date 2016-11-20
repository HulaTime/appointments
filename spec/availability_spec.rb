require 'availability'

describe Availability do
	
	let(:availability) { described_class.new }

	ARG_ERROR = "Format: availability.rb hh:mm (24hr)"
	FORMAT_ERROR = "You did not enter a time\n#{ARG_ERROR}"
	RANGE_ERROR = "Sorry, bookings are only available between 08:00 and 15:00"

	context 'Command Line Argument' do
		it 'initialized with ARGV from command line' do
			stub_const("ARGV", ['12:00'])
			expect(availability.time).not_to eq []
		end

		it 'Error if argument provided is not a time' do
			stub_const("ARGV", ['hello'])
			expect{availability}.to raise_error FORMAT_ERROR
		end

		it 'Error if more/less than 1 argument provided' do
			stub_const("ARGV", ['12:15', 'hello'])
			expect{availability}.to raise_error ARG_ERROR
		end

		it 'Error if time outside of bookable range' do
			stub_const("ARGV", ['07:15'])
			expect{availability}.to raise_error RANGE_ERROR
		end
	end

end