json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :author_url, :author, :post_id
  json.url comment_url(comment, format: :json)
end
