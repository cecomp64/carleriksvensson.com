json.array!(@posts) do |post|
  json.extract! post, :id, :content, :title, :posted_on, :published, :user_id
  json.url post_url(post, format: :json)
end
