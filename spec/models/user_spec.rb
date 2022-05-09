require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create (:user) } # Используя фабрику создаем юзера с указанными в фабрике значениями

  describe "#create" do # Блок по тестированию создания Юзера
    context "create user with valid params" do
      it "should not raise exception" do
        expect{ user.save! }.not_to raise_exception # Проверяем что сохранение Юзера с валидными параметрами не вызывает ошибок
      end
    end
  end

  describe "#create" do # Блок по тестированию апдейта Юзера
    context "update user with valid params" do
      it "should not raise exception" do
        expect{ user.update!(email: 'some_email@mail.com', password: "142536", password_confirmation: "142536") }.not_to raise_exception # Проверяем что сохранение Юзера с валидными параметрами не вызывает ошибок
      end
    end
    context "update user witn invalid params" do
      it "should raise exception when not valid email" do
        expect{ user.update!(email: '') }.to raise_exception(ActiveRecord::RecordInvalid, /Email can't be blank, Email is invalid/) # Проверяем что при обновлении Юзера с пустым имейлом будет ошибка
      end
    end
    context "update user witn invalid params" do
      it "should raise exception when not valid password" do
        expect{ user.update!(password: '', password_confirmation: '') }.to raise_exception
      end
    end
    context "update user witn invalid params" do
      it "should raise exception when not valid password confirmation" do
        expect{ user.update!(password: '123457690', password_confirmation: '') }.to raise_exception
      end
    end
  end
end
