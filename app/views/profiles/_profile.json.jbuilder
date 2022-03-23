json.extract! profile, :id, :username, :description, :phone_number, :avatar, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
