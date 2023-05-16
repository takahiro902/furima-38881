class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name,        presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id,   presence: true
  validates :cost_id,     presence: true
  validates :area_id,     presence: true
  validates :shipment_id, presence: true
  validates :price,       presence: true
  validates :user,        presence: true

end