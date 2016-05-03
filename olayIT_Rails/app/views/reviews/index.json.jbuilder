json.array!(@reviews) do |review|
  json.extract! review, :id, :customer_id, :squad_id, :reviewdate, :comments, :rating, :status
  json.url review_url(review, format: :json)
end
