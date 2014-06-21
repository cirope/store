json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :score, :notes, :hash, :owner_id
  json.url feedback_url(feedback, format: :json)
end
