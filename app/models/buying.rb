class Buying
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'を入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'はハイフン(-)なしで入力してください' }
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
    buying_log = BuyingLog.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building,
                   phone_number: phone_number, buying_log_id: buying_log.id)
  end
end
