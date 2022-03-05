class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :name, :introduction, presence: true
  validates :category_id, :item_status_id, :shipping_cost_id, :prefecture_id, :delivery_time, numericality: { other_than: 1 , message: "カテゴリーを選択してください"}
end
