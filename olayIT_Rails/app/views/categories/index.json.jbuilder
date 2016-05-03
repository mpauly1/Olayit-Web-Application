json.array!(@categories) do |category|
  json.extract! category, :id, :categoryname, :description
  json.url category_url(category, format: :json)
end
