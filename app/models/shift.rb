# Shift
class Shift < ApplicationRecord
  has_many :user
  @shift_all = find_each
  @shift_all.each do |shift|
    if shift.end_time.hour == 0
      end_hour = 24
    else
      end_hour = shift.end_time.hour
    end
    if shift.start_time.hour <= Time.now.hour && Time.now.hour < end_hour
      @time = shift.id
    end
  end
  scope :current_id, -> { @time }
  scope :morning, -> { find_by(name: 'morning').end_time }
  scope :evening, -> { find_by(name: 'evening').end_time }
  scope :night, -> { find_by(name: 'night').end_time }
end
