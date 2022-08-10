require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create :comment }

  describe "#create!" do
    context "with an empty params" do
      it "should to raise exception" do
        expect { Comment.create! }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe "#save!" do
    context "with valid params" do
      it "should not raise exception" do
        expect { comment.save! }.not_to raise_error
      end
    end
  end

  describe "#Update" do
    context "update comment with valid params" do
      it "should not raise exception" do
        expect { comment.update!(username: 'valid', body: "1425367890") }.not_to raise_error
      end
    end

    context "with an empty body" do
      it "should to raise exception" do
        expect { comment.update!(body: "") }.to raise_error(ActiveRecord::RecordInvalid, /Body can't be blank/)
      end
    end

    context "with short body" do
      it "should to raise exception" do
        expect { comment.update!(body: "142536789") }.to raise_error(ActiveRecord::RecordInvalid, /Body is too short/)
      end
    end

    context "with an empty username" do
      it "should to raise exception" do
        expect { comment.update!(username: '') }.to raise_error(ActiveRecord::RecordInvalid, /Username can't be blank/)
      end
    end

    context "with short username" do
      it "should to raise exception" do
        expect { comment.update!(username: 'va') }.to raise_error(ActiveRecord::RecordInvalid, /Username is too short/)
      end
    end
  end
end
