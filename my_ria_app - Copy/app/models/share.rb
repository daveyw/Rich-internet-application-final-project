class Share < ActiveRecord::Base
  attr_accessible :created_at, :from_user_id, :to_email, :to_user_id, :url
  belongs_to :from, foreign_key: 'from_user_id', class_name: 'User'
  belongs_to :to, foreign_key: 'to_user_id', class_name: 'User'
end
