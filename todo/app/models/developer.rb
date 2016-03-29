class Developer < ActiveRecord::Base
 validates :email, uniqueness: true
  has_secure_password
  has_many :entries



  # def project_total_hours
  #   total_hours = []
  #   project = self
  #   project.entries.each do |entry|
  #     total_hours << entry.duration
  #   end
  #   total_hours.sum
  # end
  #

  def seven_day
      weekly_total_hours = []
      developer = self
      now = Date.today
      developer.entries.each do |entry|
      difference_in_days = (now - entry.date).to_i
      weekly_total_hours << entry.duration if difference_in_days <= 7
      end
      weekly_total_hours.sum
    end


end
