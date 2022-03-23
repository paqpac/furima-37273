class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :params_item_id

  def index
    @purchase_address = PurchaseAddress.new
    return unless !@item.purchase.nil? || user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def params_item_id
    @item = Item.find(params[:item_id])
  end
end