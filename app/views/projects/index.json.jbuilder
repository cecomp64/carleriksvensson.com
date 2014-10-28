json.array!(@projects) do |project|
  json.extract! project, :id, :kind, :url, :picture, :description, :title
  json.url project_url(project, format: :json)
end
