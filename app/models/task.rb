class Task < ActiveRecord::Base
  belongs_to :list
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
