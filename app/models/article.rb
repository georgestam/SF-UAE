class Article < ApplicationRecord
     
  extend FriendlyId
  
  LANGUAGES = %w[ea en].freeze
  
  validates :title, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 100 }
  validates :locale,  inclusion: { in: LANGUAGES, allow_nil: false }
  
  friendly_id :title, use: :slugged
                                  
  mount_uploader :photo, PhotoUploader
  
  private
  
  def locale_enum
     %w[ea en]
  end
  
  def gravity_enum
     %w[north south east west]
  end

end

