json.extract! address, :id, :number, :street, :zip_code, :city, :country, :created_at, :updated_at
json.url address_url(address, format: :json)