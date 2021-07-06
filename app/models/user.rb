class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nick_name
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "First name is invalid. Input full-width characters"}
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Last name is invalid. Input full-width characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶ]+\z/, message: "First name kana is invalid. Input full-width katakana characters"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶ]+\z/, message: "Last name kana is invalid. Input full-width katakana characters"}
    validates :birth_day
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid" 
end
