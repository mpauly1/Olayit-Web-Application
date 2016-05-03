class HomeController < ApplicationController
  skip_before_filter :authorize

  def index
    #only get active promotions
    @promotionList = Promotion.where("startdate <= ? AND enddate >= ?",  Date.today, Date.today)

  end

  def about
  end

  def contact
  end

  def privacy
  end

  def help
  end

  def catalog
    @squads = Squad.all
  end

  def squadSearch
    @results=0
    if !params[:searchinput].nil?
      @results=1
      @searchinput = params[:searchinput]
      @searchcriteria="%#{params[:searchinput]}%" 
      @squadList = Squad.where("description like ?",@searchcriteria)
    end 
  end

  def cart
  end

  def buy
    if !session[:user_id]
      redirect_to login_url
    else
      # Get the specific product selected to be purchased and the quantity.
      # Converting the value to integer using the to_i method
      @prodid = params[:prodid].to_i;
      @qty = params[:qty].to_i;
      
      # Set session cart arrays to nil. 
      session[:cart_prod] << @prodid
      session[:cart_qty] << @qty

      # Redirect to display cart (shopping cart)
      redirect_to cart_url
    end
  end

  def updatecart
    # Get the specific item that needs to be removed
    cartid = params[:cartid].to_i;
    
     # Remove the specific element that is desired to be removed from the array.
    session[:cart_prod].delete_at(cartid)
    session[:cart_qty].delete_at(cartid)
    
      # Redirect to display cart (shopping cart)
    redirect_to cart_url
  end


  def checkout
    cartlen = session[:cart_prod].length
    i=0
    if cartlen > 0
      # Save new record in Order table
      # Customer ID, Sale Date and Sale Notes
      orderid = Order.create(customer_id: session[:user_id], saledate: Date.today, salenotes: session[:cart_prod].to_s)
      # For each item in the shopping cart save the record in the in OrderItem table
      while i < cartlen
        OrderItem.create(order_id: orderid, squad_id: session[:cart_prod][i].to_i, saleprice: Squad.find(session[:cart_prod][i].to_i).saleprice, prodqty: session[:cart_qty][i])
        i = i + 1
      end 

      # Set session cart arrays to nil. 
      session[:cart_prod] = Array.new
      session[:cart_qty] = Array.new
    end
  end


end

















