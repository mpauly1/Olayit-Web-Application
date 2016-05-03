json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :title, :description, :imagepath, :startdate, :enddate
  json.url promotion_url(promotion, format: :json)
end
