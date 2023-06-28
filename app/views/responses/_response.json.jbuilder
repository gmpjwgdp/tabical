json.extract! response, :id, :name, :post_id, :ba, :address, :lat, :lon, :genre, :tag, :summary, :content, :created_at, :updated_at
json.url response_url(response, format: :json)
