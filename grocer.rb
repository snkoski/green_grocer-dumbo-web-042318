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
    coupons.each do |coupon|
    coupon.each do |key, value|
      if name == value
        attributes[:count] -= coupon[:num]
        coupons_applied["#{name} W/COUPON"] = {price: coupon[:cost], clearance: attributes[:clearance], count: coupons.count(coupon)}
      end
    end
    end
  end
  if coupons_applied.size >= 1
    cart.merge!(coupons_applied)
  end
  cart
end

def apply_clearance(cart)
  cart.each do |name, attributes|
      if attributes[:clearance] == true
        new_price = minus_20_percent(attributes[:price])
        attributes[:price] = new_price
      end
    end
  cart
end

def checkout(cart, coupons)
  # code here
end


cart = {
  "PEANUTBUTTER" => {:price => 3.00, :clearance => true,  :count => 2},
  "KALE"         => {:price => 3.00, :clearance => false, :count => 3},
  "SOY MILK"     => {:price => 4.50, :clearance => true,  :count => 1}
}

coupons = [{:item => "AVOCADO", :num => 2, :cost => 5.0}]
def minus_20_percent(price)
  twenty_percent = price * 0.20
  #binding.pry
  return (price - twenty_percent)
end


puts apply_clearance(cart)