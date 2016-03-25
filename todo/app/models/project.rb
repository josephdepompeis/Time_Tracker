class Project < ActiveRecord::Base
  has_many :entries
  validates :max_time_spent, presence: true



  def project_total_hours
    total_hours = []
    project = self
    project.entries.each do |entry|
      total_hours << entry.duration
    end
    total_hours.sum
  end


end
