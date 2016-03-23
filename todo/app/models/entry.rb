class Entry < ActiveRecord::Base
  validates :duration, presence: true
  validates :developer_id, presence: true
  validates :date, presence: true


  belongs_to :developer
end