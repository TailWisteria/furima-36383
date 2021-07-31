require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品登録機能' do
    context '商品登録できる時' do
      it 'user_id,name,detail,category_id,condition_id,shipping_charge_id,required_day_id,region_id,price,imageがあれば登録できる' do
        expect(@item).to be_valid
      end
      it 'nameが40字以内なら登録できる' do
        @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@item).to be_valid
      end
      it 'detailが100文字以内なら登録できる' do
        @item.detail = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが300~9,999,999の間のみ登録できる' do
        @item.price = 100000000
        expect(@item).to be_valid
      end
    end
    context '商品登録できない時' do
      it 'imageが添付されていなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字を超えると登録できない' do
        @item.name = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'detailが100文字を超えると登録できない' do
        @item.detail = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is too long (maximum is 100 characters)")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_charge_idが空では登録できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'required_day_idが空では登録できない' do
        @item.required_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Required day can't be blank")
      end
      it 'region_id何からでは登録できない' do
        @item.region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でなければ登録できない' do
        @item.price = ３００
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
