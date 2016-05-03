json.array!(@squads) do |squad|
  json.extract! squad, :id, :squadname, :squadimage, :description, :category_id, :saleprice, :status, :purchaseprice, :qtyonhand, :reorderpoint, :reorderqty
  json.url squad_url(squad, format: :json)
end
