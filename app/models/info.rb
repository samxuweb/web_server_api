class Info < ActiveRecord::Base

  belongs_to :user

  # validates :user_sex, :presence => {:message => "user sex can not be blank"}
  # validates :nickname, :presence => {:message => "nickname can not be blank"}
  # validates :age, :presence => {:message => "age can not be blank"}
  # validates :height, :presence => {:message => "height can not be blank"}
  # validates :weight, :presence => {:message => "weight can not be blank"}
  # validates :pace, :presence => {:message => "pace can not be blank"}

end
