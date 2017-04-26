class Course < ApplicationRecord
  
  LANGUAGES = %w[ea en].freeze
  
  validates :date_start, presence: true
  validates :date_finish, presence: true
  validates :time_start, presence: true
  validates :location, presence: true
  validates :locale,  inclusion: { in: LANGUAGES, allow_nil: false }
  
  private
  
  def locale_enum
     %w[ea en]
  end
  
end
