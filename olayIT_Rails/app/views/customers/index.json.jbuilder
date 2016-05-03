json.array!(@customers) do |customer|
  json.extract! customer, :id, :firstName, :lastName, :email, :phoneNumber, :address1, :address2, :city, :state, :zip, :additionalNotes
  json.url customer_url(customer, format: :json)
end
