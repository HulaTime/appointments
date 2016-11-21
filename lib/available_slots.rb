require 'json'
require 'byebug'

class AvailableSlots

	attr_reader :parsed_file, :bookings

	def initialize
		raw_file = File.read(ROOT_PATH + "/assets/availability_slots.json")
		@parsed_file = JSON.parse(raw_file)['availability_slots']
		@bookings = {1=>[], 2=>[]}
	end

	def closest_appointment(arg)
		secs = find_seconds(arg)
		close_app = nil
		time_diff = SECS_IN_DAY
		parsed_file.each do |slot|
			slot_time = find_seconds(slot['time'])
			close_app = slot if (slot_time - secs).abs < time_diff
			time_diff = (slot_time - secs).abs if (slot_time - secs).abs < time_diff
		end
		return close_app
	end

	def book_slot(time)
		app = closest_appointment(time)
		if bookings[1].empty? || bookings[2].empty?
			bookings[1].include?(app) ?	bookings[2].push(app) :	bookings[1].push(app)
		end
		return app['time']
	end

	private

	ROOT_PATH = File.join(File.dirname(__FILE__), '..')
	SECS_IN_DAY = 86400

	def find_seconds(t)
		time = t.split(":")
		secs = (time[0].to_i*3600) + (time[1].to_i*60) + time[2].to_i
	end

end