class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  default_scope -> { order('rank DESC') }

  validates :title, presence: true, length: { minimum: 10, maximum: 50 }
  validates :url, presence: true
  validates :user_id, presence: true


  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def total_votes
    self.votes.sum(:value).to_i
  end

  def update_link
    new_rank = up_votes - down_votes

    self.update_attribute(:rank, new_rank)
  end
end
