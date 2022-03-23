json.extract! publication_content, :id, :file, :description, :order, :type, :publication_id, :created_at, :updated_at
json.url publication_content_url(publication_content, format: :json)
