class Post < ActiveRecord::Base
  validates :post_text, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :photo, :styles => { 
    :original => ['1920x1680>', :jpg],
    :small    => ['100x100#',   :jpg],
    :medium   => ['250x250',    :jpg],
    :large    => ['500x500>',   :jpg]
    }
    validates_attachment_content_type :photo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  
end
