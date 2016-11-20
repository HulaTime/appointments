require 'availability'

describe Availability do
	
	let(:availability) { described_class.new }

	it 'initialized with ARGV from command line' do
		expect(availability.time).to be_truthy
	end

end