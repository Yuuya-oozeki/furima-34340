require 'rails_helper'

#user = User.new(nick_name: "abc", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", last_name:"太郎", first_name:"山田", last_name_kana:"タロウ", first_name_kana:"ヤマダ", birth_day:1930-01-01)
#expect(user.errors.full_messages).to include("")
#bundle exec rspec spec/models/user_spec.rb 
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録できる時' do
        it 'nick_nameが空でない時に新規登録できる'do
          @user.nick_name = 'やまだ'
          expect(@user).to be_valid
        end
        it 'emailがあれば新規登録できる'do
          @user.email = 
          expect(@user).to be_valid
        end
        it 'passwordとpassword_confirmationが半角英数字混合であれば新規登録できる' do
          @user.password = 'aaa111'
          @user.password_confirmation = 'aaa111'
          expect(@user).to be_valid
        end
        it 'first_nameが全角ひらがなカタカナ漢字のみであれば新規登録できる' do
          @user.first_name = '山田'
          expect(@user).to be_valid
        end
        it 'last_nameが全角ひらがなカタカナ漢字のみであれば新規登録できる' do
          @user.last_name = '太郎'
          expect(@user).to be_valid
        end
        it 'first_name_kanaが全角カタカナの場合のみ新規登録できる' do
          @user.first_name_kana = 'ヤマダ'
          expect(@user).to be_valid
        end
        it 'last_name_kanaが全角カタカナの場合のみ新規登録できる' do
          @user.last_name_kana = 'タロウ'
          expect(@user).to be_valid
        end
        it 'birth_dayが空でなければ新規登録できる' do
          @user.birth_day = '1930-01-01'
          expect(@user).to be_valid
        end
    end
    context '新規登録できない時' do
        it 'nick_nameが空では新規登録できない' do
          @user.nick_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include ("Nick name can't be blank")
        end
        it 'emailが空では新規登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email can't be blank")
        end
        it 'emailに@を含まなければ新規登録ができない' do
          @user.email = 'test.gmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Email is invalid")
        end
        it "重複したemailが存在する場合新規登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'passwordが空では新規登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password can't be blank")
        end
        it 'passwordが半角英字のみでは新規登録できない' do
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password is invalid")
        end
        it 'passwordが半角数字のみでは新規登録できない' do
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password is invalid")
        end
        it 'passwordが6文字以上ではないと新規登録できない' do
          @user.password = 'aaa11'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
        end
        it 'passwordとpassword_confimationが一致していないと新規登録できない' do
          @user.password = 'aaa111'
          @user.password_confirmation = 'bbb222'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
        end
        it 'passwordが全角では新規登録できない' do
          @user.password = 'AAA111'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
        end
        it 'first_nameが空では新規登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name can't be blank")
        end
        it 'first_nameが全角ひらがなカタカナ漢字のみでなければ新規登録できない' do
          @user.first_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name is invalid. Input full-width characters")
        end
        it 'last_nameが空では新規登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name can't be blank")
        end
        it 'last_nameが全角ひらがなカタカナ漢字のみでなければ新規登録できない' do
          @user.last_name = 'tarou'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name is invalid. Input full-width characters")
        end
        it 'first_name_kanaが空では新規登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name kana can't be blank")
        end
        it 'first_name_kanaが全角カタカナのみでなければ新規登録できない' do
          @user.first_name_kana = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include ("First name kana is invalid. Input full-width katakana characters")
        end
        it 'last_name_kanaが空では新規登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
        end
        it 'last_name_kanaが全角カタカナのみでなければ新規登録できない' do
          @user.last_name_kana = 'tarou'
          @user.valid?
          expect(@user.errors.full_messages).to include ("Last name kana is invalid. Input full-width katakana characters")
        end
        it 'birth_dayが空では新規登録できない' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Birth day can't be blank")
        end
    end
  end
end