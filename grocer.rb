require 'pry'

def consolidate_cart(cart)
  consolidated = {}
  
  cart.each do |items|
    items.each do |name, attributes|
      consolidated[name] = {price: attributes[:price], clearance: attributes[:clearance], count: cart.count(items)}
    end
  end
  consolidated
end

def apply_coupons(cart, coupons)
  coupons_applied = {}
  
  cart.each do |name, attributes|
    coupons.each do |key, value|
    #binding.pry
      if name == value
        attributes[:count] -= coupons[:num]
        binding.pry
      end
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end


cart = {
  "AVOCADO" => {:price => 3.0, :clearance => true, :count => 3},
  "KALE"    => {:price => 3.0, :clearance => false, :count => 1}
}

coupons = {:item => "AVOCADO", :num => 2, :cost => 5.0}

puts apply_coupons(cart, coupons)