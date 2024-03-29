json.array!(@articles) do |article|
  json.extract! article, :id, :title, :post, :user_id, :published_date
  json.url article_url(article, format: :json)
end
