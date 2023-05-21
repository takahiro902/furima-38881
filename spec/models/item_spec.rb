require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it '入力に問題がなければ出品ができる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      it '商品画像が無いと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image must be attached')
      end
      it '商品の名前が空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が未選択だと出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担が未選択だと出品できない' do
        @item.cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it '発送元の地域が未選択だと出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数が未選択だと出品できない' do
        @item.shipment_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it '販売価格が未入力だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が¥300未満の場合は出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が¥9,999,999より高い場合出品ができない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格は全角数字では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は半角英字では出品できない' do
        @item.price = 'Three_hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格は漢数字では出品できない' do
        @item.price = '三百円'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
