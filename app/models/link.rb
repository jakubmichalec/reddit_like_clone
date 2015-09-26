class Link < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
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
    self.votes.count(:value).to_i
  end

  def update_rank
    self.update_attribute(:rank, rank_count)
  end

  def created_at
    self[:created_at].strftime("%d/%m/%Y")
  end

  def rank_count
    time = ((self[:created_at] - Time.current) / 3600).round
    score = (up_votes - 1) / (time + 2) ^ 2
    return score
  end

  def author
    self.user.name
  end
end
