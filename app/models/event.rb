require 'date'
class Event < ApplicationRecord
  belongs_to :admin, class_name: "User"
  has_one_attached :image
  has_many :attendances

  validates :start_date, 
    presence: true
  validates :duration, 
    presence: true,
    numericality: { greater_than: 0 }
  validates :title, 
    presence: true,
    length: { in: 5..140 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true
  validate :date_not_in_past
  validate :multiple_of_5

  private 
  def date_not_in_past
    unless start_date.present? && start_date > DateTime.now
      errors.add(:start_date, "can't be in the past")
    end
  end

  def multiple_of_5
    unless duration.present? && duration % 5 == 0
      errors.add(:duration, "it should be a multiple of 5")    
    end
  end

end
