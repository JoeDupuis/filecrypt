json.extract! upload, :id, :created_at, :updated_at
json.url full_url_for(upload.file)
