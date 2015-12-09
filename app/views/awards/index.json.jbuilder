json.array!(@awards) do |award|
  json.extract! award, :id, :title, :event, :dateAwarded
  json.url award_url(award, format: :json)
end
