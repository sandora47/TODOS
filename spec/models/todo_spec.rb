require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:todo) { FactoryBot.create :todo }

  describe "#create!" do
    context "with an empty params" do
      it "should to raise exception" do
        expect { Todo.create! }.to raise_exception(ActiveRecord::RecordInvalid)
      end
    end
  end

   describe "#save!" do
    context "with valid params" do
      it "should not raise exception" do
        expect { todo.save! }.not_to raise_error
      end
    end
   end

  describe "#Update" do
    context "update comment with valid params" do
      it "should not raise exception" do
        expect { todo.update!(title: 'valid', body: "1425367890") }.not_to raise_error
      end
    end

    context "with an empty username" do
      it "should to raise exception" do
        expect { todo.update!(title: '') }.to raise_error(ActiveRecord::RecordInvalid, /Title can't be blank/)
      end
    end

    context "with short username" do
      it "should to raise exception" do
        expect { todo.update!(title: 'va') }.to raise_error(ActiveRecord::RecordInvalid, /Title is too short/)
      end
    end
  end
end
