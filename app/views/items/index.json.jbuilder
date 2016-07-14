json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :price, :status, :published_date
  json.url item_url(item, format: :json)
end
