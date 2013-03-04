#!/usr/bin/env ruby
# encoding: utf-8
require "pry"

root = File.expand_path("../../", __FILE__)
$: << root

require "lib/remote_menu_items"
require "lib/purchase_target_amount"

puts 'Welcome'
puts 'Please enter a URL'
data_file = gets.chomp
puts "Would you like to display the output? Type 'yes' or 'no'"
output = gets.chomp
display_output = output == "yes" ? true : false

DATA_FILE_URI = data_file.freeze

target_amount, menu = RemoteMenuItems.parse(DATA_FILE_URI)
computed_solution = PurchaseTargetAmount.dynamic_solution(target_amount, menu, display_output)

purchased_item_names = computed_solution.collect do |item_cost|
  menu.key(item_cost)
end

items_and_their_count = purchased_item_names.reduce(Hash.new(0)) do |hash, count|
  hash[count] += 1
  hash
end

puts "With $#{target_amount} in your wallet.\n"
puts "And the following items on the menu: #{menu}\n"
puts "You can most efficiently purchase: #{items_and_their_count}"