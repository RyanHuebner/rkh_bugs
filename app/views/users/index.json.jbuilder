json.array!(@users) do |user|
  json.extract! user, :id, :last_name, :first_name, :email, :thumbnail
  json.url user_url(user, format: :json)
end
