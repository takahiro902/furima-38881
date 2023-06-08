class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      set_item
      if @item.order.present?
        redirect_to root_path
      elsif @item.user_id != current_user.id
        @order_address = OrderAddress.new
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    set_item
    if @order_address.valid?
      pay_item
      @order_address.save(params, current_user.id)
      redirect_to root_path
    else
      set_item
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :area_id, :city, :block, :building_name, :phone_number, :order_id, :price).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
