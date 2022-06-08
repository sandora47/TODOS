require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'before publication' do
    it 'cannot have comments' do
      expect { todo.save! }.not_to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "Update" do
    context "update comment with valid params" do
      it "should not raise exception" do
        expect{ todo.update!(title: 'valid') }.not_to raise_error(ActiveRecord::RecordInvalid)
      end
    end
    context "update comment with invalid params" do
      it "should not raise exception" do
        expect{ todo.update!(title: '') }.to raise_error
      end
    end
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ comment.update!(username: 'vali') }.to raise_error
      end
    end
  end
end
