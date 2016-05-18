class SportTime < ActiveRecord::Base

  belongs_to :users

  def self.get_sport_time_by_date(date)
    start_stamp = date.to_datetime.strftime '%Q'
    end_stamp = date.to_datetime.end_of_day.strftime '%Q'
    SportTime.where("#{SportTime.table_name}.time_stamp >= :s AND #{SportTime.table_name}.time_stamp <= :e", :s => start_stamp, :e => end_stamp)
  end

end
