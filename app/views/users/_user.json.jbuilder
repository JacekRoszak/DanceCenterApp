json.extract! user, :id, :email, :passwod, :admin, :zin, :can_host, :created_at, :updated_at
json.url user_url(user, format: :json)
