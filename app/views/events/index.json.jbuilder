json.array!(@events) do |event|
  json.extract! event, :id, :event, :eventdate, :notes
  json.url event_url(event, format: :json)
end
