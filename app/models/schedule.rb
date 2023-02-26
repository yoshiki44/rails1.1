class Schedule < ApplicationRecord
  validates :title,
    presence: true,
    length: { maximum: 20 }

  validates :start,
    presence: true

  validates :finish,
    presence: true

  validate :end_check

  validates :memo,
    length: {maximum: 500}

  def end_check
    unless self.start.nil? || self.finish.nil?
      errors.add(:finish, "は開始日より前の日付は登録できません。") if self.start > self.finish
    end
  end
end
