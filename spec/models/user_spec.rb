require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、cc_last_name,cc_fist_name,kk_last_name,kk_first_name,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user). to be_valid
      end
      it 'お名前（全角）が全角（漢字、ひらがな、カタカナ）であれば登録できる' do
        @user.cc_last_name = '山田'
        @user.cc_first_name = 'たロウ'
        expect(@user). to be_valid

      end
      it 'お名前（カナ）が全角（カタカナ）であれば登録できる' do
        @user.kk_last_name = 'ヤマダ'
        @user.kk_first_name = 'タロウ'
        expect(@user). to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'cc_last_nameが空では登録できない' do
        @user.cc_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Cc last name can't be blank")
      end
      it 'cc_first_nameが空では登録できない' do
        @user.cc_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Cc first name can't be blank")
      end
      it 'kk_last_nameが空では登録できない' do
        @user.kk_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kk last name can't be blank")
      end
      it 'kk_first_nameが空では登録できない' do
        @user.kk_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kk first name can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end 
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'cc_last_nameが全角（漢字、ひらがな、カタカナ）でない場合は登録できない' do
        @user.cc_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Cc last name is invalid')
      end
      it 'cc_first_nameが全角（漢字、ひらがな、カタカナ）でない場合は登録できない' do
        @user.cc_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Cc first name is invalid')
      end
      it 'kk_last_nameが全角（カタカナ）でない場合は登録できない' do
        @user.kk_last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kk last name is invalid')
      end
      it 'kk_first_nameが全角（カタカナ）でない場合は登録できない' do
        @user.kk_first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kk first name is invalid')
      end
      it 'kk_first_nameが半角（カタカナ）では登録できない' do
        @user.kk_first_name = 'ｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kk first name is invalid')
      end
    end
  end
end
