json.array!(@gallery_items) do |gallery_item|
  json.extract! gallery_item, :id, :title, :description, :gallery_id, :cover
  json.url gallery_item_url(gallery_item, format: :json)
end
