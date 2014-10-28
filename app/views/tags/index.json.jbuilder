json.array!(@tags) do |tag|
  json.extract! tag, :id, :value, :project_id, :post_id
  json.url tag_url(tag, format: :json)
end
