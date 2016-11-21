#!/usr/local/bin/ruby

require './lib/available_slots.rb'
require './lib/check_time.rb'

time = ARGV[0]

CheckTime.new(time)

slots = AvailableSlots.new

puts "\nYour appointment has been booked for #{slots.book_slot(time)}"