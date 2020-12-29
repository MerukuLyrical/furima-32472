require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '各フォームを入力すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空だと登録できない' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'ユーザー本名は名前が必須でないと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名は苗字が必須でないと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー本名(名前)は漢字,カタカナ,平仮名での入力が必須であること' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
    end
    it 'ユーザー本名(苗字)は漢字,カタカナ,平仮名での入力が必須であること' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナ(名前)は必須でないと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'ユーザー本名のフリガナ(苗字)は必須でないと登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'ユーザー本名のフリガナ(名前)は漢字では登録できないこと' do
      @user.first_name_kana = '試験'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana には全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナ(名前)はひらがなでは登録できないこと' do
      @user.first_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana には全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナ(苗字)は漢字では登録できないこと' do
      @user.last_name_kana = '試験'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana には全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナ(苗字)はひらがなでは登録できないこと' do
      @user.last_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana には全角文字を使用してください')
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'aaaaaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmaitonが不一致だと登録できない' do
      @user.password = '1234aaaa'
      @user.password_confirmation = '123aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = '123aa'
      @user.password_confirmation = '123aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは英数字混合でなければ登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字を混合して設定してください')
    end
    it '生年月日の入力がなければ登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
