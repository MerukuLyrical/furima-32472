class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :delivary_fee
  belongs_to :need_day
  belongs_to :status
  has_one_attached :image



  validates :area_id,         numericality: { other_than: 1 } 
  validates :category_id,     numericality: { other_than: 1 } 
  validates :delivary_fee_id, numericality: { other_than: 1 } 
  validates :need_day_id,     numericality: { other_than: 1 } 
  validates :status_id,       numericality: { other_than: 1 } 
end
