class User < ActiveRecord::Base

  has_one :info
  has_one :setting
  has_one :security_code

  validates :username, :presence => {:message => "presence"},
                       :uniqueness => {:message => "uniqueness"}
  validates :userpwd, :presence => {:message => "password can not be blank"}

  def get_image_path
    return "public/image/" + self.info.head_portrait
  end

end
