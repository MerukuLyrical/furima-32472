require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      
    end
      context '内容に問題がない場合' do
        it '各フォームを入力すれば出品できること' do
        expect(@item).to be_valid
        end
      end
      context '内容に問題がある場合' do
          it '商品タイトルが空だと出品できない' do
          @item.title = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it '説明文が空だと出品できない' do
          @item.explaining = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Explaining can't be blank")
        end
        it '画像が空だと出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'カテゴリーは空欄(--)だと出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it '商品の状態は空欄(--)だと出品できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end
        it '出品地域は空欄(--)だと出品できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end
        it '配送料の負担は空欄(--)だと出品できない' do
          @item.delivary_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivary fee must be other than 1')
        end
        it '配送までの時間は空欄(--)だと出品できない' do
          @item.need_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Need day must be other than 1')
        end
        it '価格は空だと出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格は¥300未満だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it '価格は¥10000000未満だと出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it '価格は全角数字だと出品できない' do
          @item.price = "１００００"
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end        
      end
    end
  end
