class Vote < ActiveRecord::Base
  belongs_to :link
  belongs_to :user

  validates :value, inclusion: { in: [-1,1],
                    message: "%{value} is not a valid vote" }
  validates_presence_of :user_id, :link_id


  after_save :update_link

  private

    def update_link
      self.link.update_link
    end
end
