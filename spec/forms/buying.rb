require 'rails_helper'

RSpec.describe Buying, type: :model do
  before do
    @buying = FactoryBot.build(:buying)
    item_id = FactoryBot.build(:item)
    user_id = FactoryBot.build(:user)
  end

  describe '購入が正常に完了する時' do
    it '各フォームを入力すれば出品できること' do
      expect(@buying).to be_valid
    end
  end

  describe '購入が完了しない時' do
    it '郵便番号は空欄だと購入できない' do
      @buying.postal_code = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号は半角数字以外使用できない' do
      @buying.postal_code = '試験用'
      @buying.valid?
      expect(@buying.errors.full_messages).to include('Postal code を入力してください')
    end

    it '郵便番号はハイフンがないとエラーが出る' do
      @buying.postal_code = '1111111'
      @buying.valid?
      expect(@buying.errors.full_messages).to include('Postal code を入力してください')
    end

    it '都道府県は空欄(--)だとエラーが出る' do
      @buying.area_id = 1
      @buying.valid?
      expect(@buying.errors.full_messages).to include('Area must be other than 1')
    end

    it '市町村は空欄だとエラーが出る' do
      @buying.city = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("City can't be blank")
    end

    it '住所は空欄だとエラーが出る' do
      @buying.address = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号は空欄だとエラーが出る' do
      @buying.phone_number = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号はハイフンがあるとエラーが出る' do
      @buying.phone_number = '000-0000-0000'
      @buying.valid?
      expect(@buying.errors.full_messages).to include('Phone number はハイフン(-)なしで入力してください')
    end

    it 'トークンは空欄だとエラーが出る' do
      @buying.token = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Token can't be blank")
    end
  end
end
