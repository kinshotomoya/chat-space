require 'rails_helper'

describe Chat do
  describe "#create" do
    it "is invalid without a text" do
      chat = build(:chat, text: "")
      chat.valid?
      expect(chat.errors[:text]).to include("を入力してください")
    end

    it "is valid with a text" do
      chat = build(:chat)
      chat.valid?
      expect(chat).to be_valid
    end
  end
end

