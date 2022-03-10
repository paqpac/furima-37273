require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録が出来る場合' do
    it "画像、商品名、商品の説明、商品の詳細(カテゴリー、商品の状態)、配送について(配送料の負担、発送元の地域、発送までの日数)、販売価格があれば登録できる" do
    expect(@item).to be_valid
    end
  end

  context '商品登録が出来ない場合' do
    it "画像が空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では登録できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では登録できない" do
      @item.introduction = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it "カテゴリーを選択しないと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category リストから選択してください")
    end

    it "商品の状態を選択しないと登録できない" do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status リストから選択してください")
    end

    it "配送料の負担を選択しないと登録できない" do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost リストから選択してください")
    end

    it "発送元の地域を選択しないと登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture リストから選択してください")
    end

    it "発送までの日数を選択しないと登録できない" do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery time リストから選択してください")
    end

    it "販売価格が空では登録できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "販売価格が¥299以下では登録できない" do
      @item.price = Faker::Number.between(from: 1, to: 299 )
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 金額が正しくありません")
    end

    it "販売価格が¥10000000以上では登録できない" do
      @item.price = Faker::Number.between(from: 10000000 )
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 金額が正しくありません")
    end

    it "販売価格が半角数値以外では登録できない" do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 金額が正しくありません")
    end

  end
end
