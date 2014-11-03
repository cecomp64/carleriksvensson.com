json.array!(@images) do |image|
  json.extract! image, :id, :primary, :project_id
  json.url image_url(image, format: :json)
end
