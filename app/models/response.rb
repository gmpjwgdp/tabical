class Response < ApplicationRecord
  mount_uploader :img, ImgUploader
  belongs_to :post
  belongs_to :user, optional: true
  geocoded_by :address
  after_validation :geocode
  
  validates :name, presence: true, length:{maximum: 20}
  validates :address, length:{maximum: 50}
  validates :summary, length:{maximum: 50}
  validates :content, presence: true, length:{maximum: 999}, on: :create
end
