require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }

  describe "#create!" do
    context "with an empty params" do
      it "should to raise exception" do
        expect { User.create! }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe "#save!" do
    context "with valid params" do
      it "should not raise exception" do
        expect { user.save! }.not_to raise_error
      end
    end
  end

  describe "#Update" do
    context "update email with valid params" do
      it "should not raise exception" do
        expect { user.update!(email: 'rspec@mail.com') }.not_to raise_error
      end
    end

    context "update password with valid params" do
      it "should not raise exception" do
        expect { user.update!(password: '1234', password_confirmation: '1234') }.not_to raise_error
      end
    end

    context "with an empty email" do
      it "should to raise exception" do
        expect { user.update!(email: "") }.to raise_error(ActiveRecord::RecordInvalid, /Email can't be blank/)
      end
    end

    context "with no email" do
      it "should to raise exception" do
        expect { user.update!(email: "142536789") }.to raise_error(ActiveRecord::RecordInvalid, /Email is invalid/)
      end
    end

    context "with an empty password confirmation" do
      it "should to raise exception" do
        expect { user.update!(password_confirmation: "") }.to raise_error(ActiveRecord::RecordInvalid, /Password confirmation can't be blank/)
      end
    end

    context "with short password" do
      it "should to raise exception" do
        expect { user.update!(password: '123', password_confirmation: '123') }.to raise_error(ActiveRecord::RecordInvalid, /Password is too short/)
      end
    end

    context "with an empty password" do
      it "should to raise exception" do
        expect { user.update!(password: '', password_confirmation: '') }.to raise_error(ActiveRecord::RecordInvalid, /Password confirmation doesn't match Password, Password confirmation doesn't match Password/)
      end
    end

    context "with an empty password" do
      it "should to raise exception" do
        expect { user.update!(password: '123123123123', password_confirmation: '76457775') }.to raise_error(ActiveRecord::RecordInvalid, /Password confirmation doesn't match Password/)
      end
    end
  end
end
