class Completion < ActiveRecord::Base

  belongs_to :user

  def self.update_completion(completion_params)
    current_completion = Completion.where(:date => completion_params[:date])
    if current_completion.present?
      current_completion.last.destroy
    end
    Completion.create(completion_params)
  end

  def self.current
    Completion.where(:date => Time.now.strftime('%Y%m%d')).last
  end

end
