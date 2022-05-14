require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'before publication' do
    it 'cannot have comments' do
      expect { Comment.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
  describe "Update" do
    context "update comment with valid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: 'valid', body: "1425367890") }.not_to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    context "update comment with invalid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: 'valid', body: "") }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: 'valid', body: "142536789") }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: '', body: "1425367890") }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: 'va', body: "1425367890") }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: '', body: "") }.to raise_error
      end
    end
  end
end
