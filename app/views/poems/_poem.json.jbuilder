json.extract! poem, :id, :title, :aroma, :location, :content, :user_id, :created_at, :updated_at
json.url poem_url(poem, format: :json)
