json.extract! event, :id, :event_name, :start_date, :end_date, :description, :owner_id, :created_at, :updated_at
json.url event_url(event, format: :json)
