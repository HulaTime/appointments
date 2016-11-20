# require 'availability'

describe Availability do
	
	let(:availability) { described_class.new }

	ARG_ERROR = "Format: availability.rb hh:mm"

	context 'Command Line Argument' do
		it 'initialized with ARGV from command line' do
			stub_const("ARGV", ['12:15'])
			expect(availability.time).not_to eq []
		end

		it 'Error if more/less than 1 argument provided' do
			stub_const("ARGV", ['12:15', 'hello'])
			expect{availability}.to raise_error ARG_ERROR
		end
	end

end