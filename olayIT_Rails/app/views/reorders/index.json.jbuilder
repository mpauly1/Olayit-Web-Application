json.array!(@reorders) do |reorder|
  json.extract! reorder, :id, :squad_id, :qtyorder, :reorderdate, :expecteddelivery
  json.url reorder_url(reorder, format: :json)
end
