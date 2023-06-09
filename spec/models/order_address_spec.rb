require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存'
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameは空でも購入できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it '郵便番号が空では購入できない' do
      @order_address.post_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @order_address.post_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it '都道府県が未選択では購入できない' do
      @order_address.area_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Area must be other than 1')
    end
    it '市区町村が空では購入できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では購入できない' do
      @order_address.block = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end
    it '電話番号が空では購入できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号は、9桁以下では購入できない' do
      @order_address.phone_number = '090123456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Please enter numbers only')
    end
    it '電話番号は、12桁以上では購入できない' do
      @order_address.phone_number = '090123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Please enter numbers only')
    end
    it '電話番号に半角数字以外が含まれている場合は購入できない' do
      @order_address.phone_number = '090-12345678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid. Please enter numbers only')
    end
    it 'ユーザー情報紐づいていない場合は購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐づいていない場合は購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空では登録できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
