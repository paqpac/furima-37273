require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  context '内容に問題が無い場合' do
    it "カード情報、郵便番号、都道府県、市区町村、番地、電話番号があれば購入出来ること" do
      expect(@purchase_address).to be_valid
    end

    it "建物名はなくても購入出来ること" do
      @purchase_address.building_name = ""
      @purchase_address.valid?
      expect(@purchase_address).to be_valid
    end
  end

  context '内容に問題が有る場合' do
    it "カード情報が無ければ購入出来ないこと" do
      @purchase_address.token = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が無ければ購入出来ないこと" do
      @purchase_address.postal_code = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号にハイフンが無ければ購入出来ないこと" do
      @purchase_address.postal_code = "1234567"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end

    it "郵便番号は半角数値でなければ購入出来ないこと" do
      @purchase_address.postal_code = "１２３ー４５６７"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end

    it "都道府県を選択しなければ購入出来ないこと" do
      @purchase_address.prefecture_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村がなければ購入出来ないこと" do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it "番地がなければ購入出来ないこと" do
      @purchase_address.block_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Block number can't be blank")
    end

    it "電話番号がなければ購入出来ないこと" do
      @purchase_address.phone_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号は10桁以上でなければ購入出来ないこと" do
      @purchase_address.phone_number = "012345678"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end

    # it "電話番号は11桁以内でなければ購入出来ないこと" do
    # 11桁以上は入力不可なのでテストコード省略

    it "電話番号は半角数値でなければ購入出来ないこと" do
      @purchase_address.phone_number = "０１２３４５６７８９"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "userが紐付いていないと購入出来ないこと" do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
  end
end