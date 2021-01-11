require 'rails_helper'

RSpec.describe Buying, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buying = FactoryBot.build(:buying, user_id: user.id, item_id: item.id)
    sleep 0.1  
  end

  describe '購入が正常に完了する時' do
    it '各フォームを入力すれば購入できること' do
      expect(@buying).to be_valid
    end

    it '建物(building)は空でも購入できること' do
      @buying.building = nil
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
      expect(@buying.errors.full_messages).to include('Phone number はハイフン(-)なしで10桁or11桁で入力してください')
    end

    it '電話番号は12桁以上だとエラーが出る' do
      @buying.phone_number = '090123456789'
      @buying.valid?
      expect(@buying.errors.full_messages).to include('Phone number はハイフン(-)なしで10桁or11桁で入力してください')
    end

    it 'item_idは空欄だとエラーが出る' do
      @buying.item_id = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Item can't be blank")
    end

    it 'user_idは空欄だとエラーが出る' do
      @buying.user_id = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("User can't be blank")
    end

    it 'トークンは空欄だとエラーが出る' do
      @buying.token = nil
      @buying.valid?
      expect(@buying.errors.full_messages).to include("Token can't be blank")
    end
  end
end
