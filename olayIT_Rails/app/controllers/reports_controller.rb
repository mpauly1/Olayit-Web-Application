class ReportsController < ApplicationController
  def reportListing
  end

  def customerList
  	@customerList = Customer.order("lastName")
  end

  def productList
  	@squadList = Squad.all
  end

  def saleList
  	@saleList = Order.all
  end
end
