class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_many :comments
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :name, :introduction, presence: true
  validates :shipping_cost_id, :prefecture_id, :delivery_time_id,:category_id, :item_status_id,numericality: { other_than: 1 , message: "カテゴリーを選択してください"}
  validates :image, presence: true

  with_options presence: true, format: { with: /\d/, message: '半角数値のみ使用してください' } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "金額が正しくありません"}
  end
end