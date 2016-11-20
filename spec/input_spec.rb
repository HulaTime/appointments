require 'input'

describe Input do
	
	let(:input) { described_class.new }

	ARG_ERROR = "\n\nFormat: availability.rb hh:mm\n\n"
	FORMAT_ERROR = "\n\nYou did not enter a time\n#{ARG_ERROR}\n\n"

	context 'Command Line Argument' do
		it 'initialized with ARGV from command line' do
			stub_const("ARGV", ['12:15'])
			expect(input.time).not_to eq []
		end

		it 'Error if argument provided is not a time' do
			stub_const("ARGV", ['hello'])
			expect{input}.to raise_error FORMAT_ERROR
		end

		it 'Error if more/less than 1 argument provided' do
			stub_const("ARGV", ['12:15', 'hello'])
			expect{input}.to raise_error ARG_ERROR
		end
	end

end