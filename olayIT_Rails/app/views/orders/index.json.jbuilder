json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :saledate, :salenotes
  json.url order_url(order, format: :json)
end
