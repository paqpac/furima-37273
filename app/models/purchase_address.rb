class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :item_id, :user_id, :purchase, :token, :price

  with_options presence: true do
    validates :user_id, :city, :block_number, :token, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid"}
    validates :phone_number, length: {maximum: 11}, format: {with: /[0-9]{10,11}/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end