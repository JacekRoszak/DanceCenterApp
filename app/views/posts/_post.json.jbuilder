json.extract! post, :id, :author_id, :is_answer, :answer_to, :post_content, :created_at, :updated_at
json.url post_url(post, format: :json)
