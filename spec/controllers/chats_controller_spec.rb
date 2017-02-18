require 'rails_helper'

RSpec.describe ChatsController, :type => :controller do


  let(:group){create(:group)}
  let(:user){create(:user)}
  let(:chat){build(:chat)}

  before do
    sign_in user
  end

  describe 'Get#index' do
    before do
      get :index, group_id: group.id
    end

    it "redirects index view" do
      expect(response).to render_template :index
    end
  end

  describe 'POST#create' do
    context "saves the contents in the database" do
      it "saves" do
        expect{
          post :create, group_id: group.id, chat: attributes_for(:chat)
        }.to change(Chat, :count).by(1)
      end

      it "redirects index view" do
        post :create, group_id: group.id, chat: attributes_for(:chat)
        expect(response).to redirect_to group_chats_path
      end
    end

    context "not saves the contents in the database" do
      it "not saves" do
        expect{
          post :create, group_id: group.id, chat: attributes_for(:chat, text: nil)
        }.not_to change(Chat, :count)
      end

      it "redirects index view again" do
        post :create, group_id: group.id, chat: attributes_for(:chat, text: nil)
        expect(response).to redirect_to group_chats_path
      end
    end

  end
end

