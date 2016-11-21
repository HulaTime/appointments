require 'check_time'

describe CheckTime do
	
	let(:check) { described_class.new('09:00') }
	let(:check1) { described_class.new('hello') }
	let(:check2) { described_class.new('07:15') }

	ARG_ERROR = "Format: availability.rb hh:mm (24hr)"
	FORMAT_ERROR = "You did not enter a time\n#{ARG_ERROR}"
	RANGE_ERROR = "Sorry, bookings are only available between 08:00 and 15:00"

	context 'Command Line Argument' do
		it 'initialized with a time' do
			expect(check.time).not_to eq nil
		end

		it 'Error if argument provided is not a time' do
			expect{check1}.to raise_error FORMAT_ERROR
		end

		it 'Error if time outside of bookable range' do
			expect{check2}.to raise_error RANGE_ERROR
		end
	end

end