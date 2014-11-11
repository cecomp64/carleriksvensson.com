json.array!(@resume_items) do |resume_item|
  json.extract! resume_item, :id, :job_title, :start, :end, :description, :location
  json.url resume_item_url(resume_item, format: :json)
end
