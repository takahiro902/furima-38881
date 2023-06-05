class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :block, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 1}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Please enter numbers only"}
  end

  def save(params,user_id)
    order = Order.create(item_id: params[:item_id], user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

