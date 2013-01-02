# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sex.find_or_create_by_name :Man
Sex.find_or_create_by_name :Vrouw

open("db/scholen.txt") do |colleges|
  colleges.read.each_line do |college|
    College.find_or_create_by_name college.chomp
  end
end

Club.find_or_create_by_name('geen')

open("db/verenigingen.txt") do |clubs|
  clubs.read.each_line do |club|
    Club.find_or_create_by_name(club.chomp)
  end
end