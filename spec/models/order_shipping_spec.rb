require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)

    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての情報が正しく入力されていれば購入できる' do
        expect(@order_shipping).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
      it '郵便番号が、「3桁ハイフン4桁」の半角文字列であれば登録できる' do
        @order_shipping.postal_code = '123-4567'
        expect(@order_shipping).to be_valid
      end
      it '電話番号が10桁以上11桁以内の半角数値の場合登録できる' do
        @order_shipping.telephone_number = '12345678901'
        expect(@order_shipping).to be_valid
      end
    end
    context '商品が購入できない時' do
      it 'user_idが空では登録できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号がなければ購入できない' do
        @order_shipping.postal_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が、「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
        @order_shipping.postal_code = '1111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県がなければ購入できない' do
        @order_shipping.region_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村がなければ購入できない' do
        @order_shipping.municipalities = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地がなければ購入できない' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がなければ登録できない' do
        @order_shipping.telephone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が、12桁以上では登録できない' do
        @order_shipping.telephone_number = '111111111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が英数混合では登録できない' do
        @order_shipping.telephone_number = '123abcd1234'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
