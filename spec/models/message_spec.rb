require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      room = FactoryBot.create(:room)
      @message = FactoryBot.build(:message, user_id: user.id, room_id: room.id)
      @message.image = fixture_file_upload(('public/images/test_image.jpg'))
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end
    it 'contentが存在していれば保存できること' do
      @message.image = nil
      expect(@message).to be_valid
    end
    it 'imageが存在していれば保存できること' do
      @message.text = nil
      expect(@message).to be_valid
    end
    it 'contentとimageが空では保存できないこと' do
      @message.text = nil
      @message.image = nil
      @message.valid?
      expect(@message.errors[:text]).to include("can't be blank")
    end
  end
end