require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context "出品ができる場合" do
      it "入力に問題がなければ出品ができる" do
        expect(@item).to be_valid
      end
    end
    context "出品ができない場合" do
      it ""
  end
end


#| name        | string     | null: false                    |
#| description | text       | null: false                    |
#| category_id | integer    | null: false                    |
#| status_id   | integer    | null: false                    |
#| cost_id     | integer    | null: false                    |
#| area_id     | integer    | null: false                    |
#| shipment_id | integer    | null: false                    |
#| price       | integer    | null: false                    |
#| user        | references | null: false, foreign_key: true |
