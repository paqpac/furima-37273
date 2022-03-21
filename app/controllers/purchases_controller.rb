class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    return unless !@item.purchase.nil? || user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = "sk_test_34b33a415fe3688ec82e4af2"
      Payjp::Charge.create(
        amount: purchase_params[:price],
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], price: Item.find(params[:item_id]).price, token: params[:token])
  end
end