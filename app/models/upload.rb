class Upload < ApplicationRecord
  belongs_to :user
  
  
  has_attached_file :avatar, 
                    styles: { medium: "300x300>", thumb: "100x100>" }, 
                    default_url: "/images/:style/missing.png"
  validates :avatar, attachment_presence: true
  do_not_validate_attachment_file_type :avatar
  
end
