require "../lib/purchase_target_amount.rb"
require "../lib/drawer"

describe "PurchaseTargetAmount" do
  before do
    @menu_one = {mixed_fruit: 2.15, french_fries: 2.75, side_salad: 3.35, hot_wings: 3.55, mozzarella_sticks: 4.20, sampler_plate: 5.80}
  end
  it "spends every penny possible" do
    PurchaseTargetAmount.dynamic_solution(15.05, @menu_one).should =~ [2.15, 3.55, 3.55, 5.8]
  end

end