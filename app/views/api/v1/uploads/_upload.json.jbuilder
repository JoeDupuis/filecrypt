json.extract! upload, :id, :created_at, :updated_at
json.url rails_blob_url(upload.file, disposition: :inline)
