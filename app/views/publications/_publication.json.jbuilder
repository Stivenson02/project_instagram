json.extract! publication, :id, :name, :description, :type, :user_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
