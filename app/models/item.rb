class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :delivary_fee
  belongs_to :need_day
  belongs_to :status
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :explaining
    validates :price
    validates :image
  end

  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' }

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :category_id
    validates :delivary_fee_id
    validates :need_day_id
    validates :status_id
  end

  belongs_to :user
  has_one :buying_log
end
