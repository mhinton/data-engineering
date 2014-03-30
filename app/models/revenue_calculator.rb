class RevenueCalculator
  def self.total_revenue(orders)
    orders.map {|o| o.quantity * o.item.price }.sum
  end
end
