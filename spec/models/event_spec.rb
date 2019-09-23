require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "訂單的使用者" do
    it "沒有使用者" do
      event = build(:event, user: nil)
      expect(order).not_to be_valid
    end
  end

  describe "驗證收件人相關資料" do
    context "有效資料" do
      it "填寫完整資料" do
        order = build(:order)
        expect(order).to be_valid
      end

      # specify { expect(build(:order)).to be_valid }
    end

    context "無效資料" do
      it "未填寫完整資料" do
        order = build(:order, :invalid)
        expect(order).not_to be_valid
      end
    end
  end

end




