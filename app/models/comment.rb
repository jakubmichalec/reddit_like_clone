class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user

  def author
    self.user.name
  end
end
