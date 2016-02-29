json.array!(@events) do |event|
  json.extract! event, :id, :venue_id, :starts_at, :price, :soldout
  json.url event_url(event, format: :json)
end
