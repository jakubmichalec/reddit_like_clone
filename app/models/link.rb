class Link < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 10, maximum: 50 }
  validates :url, presence: true
end
