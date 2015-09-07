class Link < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true, length: { minimum: 10, maximum: 50 }
  validates :url, presence: true
  validates :user_id, presence: true
end
