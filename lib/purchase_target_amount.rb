require "pry"
require "../lib/drawer"

class PurchaseTargetAmount
  extend Drawer

  def self.dynamic_solution(target_amount, menu = {hot_dog: 2.50, ham_sandwich: 3.50, beer: 5.50}, output = false)
    @output ||= output
    costs = menu.values.sort.reverse
    costs.reject! {|value| value > target_amount}
draw("Solving for #{costs}") unless @output == false

    possible_solutions = costs.collect do |item_cost|
      cash_left_over = target_amount - item_cost
      possible_solution = [item_cost]
      possible_solution += dynamic_solution(cash_left_over, menu)
      possible_solution.sort {|cost_one, cost_two| cost_one <=> cost_two}
    end

    possible_solutions.uniq!
    possible_solutions.sort! { |cart_a, cart_b| cart_b.reduce(0, :+) <=> cart_a.reduce(0, :+) }
draw("Possible solutions: #{possible_solutions}") unless @output == false
    possible_solutions.first || []
  end
end