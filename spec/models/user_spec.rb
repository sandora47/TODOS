require 'rails_helper'

RSpec.describe User, type: :model do
  context 'before publication' do
    it 'cannot have comments' do
      expect { user.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  describe "Update" do
    context "update comment with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'valid@valid.com', password: "1234567890", password_confirmation: '1234567890') }.not_to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    context "update comment with invalid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'valid@valid', password: "1234567890", password_confirmation: '1234567890') }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'valid', password: "1234567890", password_confirmation: '1234567890') }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: '', password: "1234567890", password_confirmation: '1234567890') }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'valid@valid.com', password: "123", password_confirmation: '123') }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'valid@valid.com', password: "", password_confirmation: '') }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'valid@valid.com', password: "1234", password_confirmation: '4321') }.to raise_error
      end
    end
  end
end
