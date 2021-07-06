require 'rails_helper'

#user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
#expect(user.errors.full_messages).to include("")
#bundle exec rspec spec/models/user_spec.rb 
RSpec.describe User, type: :model do


  describe "ユーザー新規登録" do
    it "nick_nameが空だと登録できない" do
      user = User.new(nick_name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nick_name: "abc", email: "", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"", first_name_kana:"ヤマダ", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"", birth_day:1930-01-01)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dayが空では登録できない" do
      user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:"")
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
 
end
