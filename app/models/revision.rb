class Revision < ActiveRecord::Base
  validates :version, :uniqueness => true
  # validates :file_url, :presence => true

  def get_file_path
    return "public/files/" + self.file_url
  end

end
