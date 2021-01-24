class User < ApplicationRecord

#作成したUserモデルにdeviseで使用する機能が記述されている
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image
  #attachmentには、カラム名（profile_image_id）から_idを除いた名前（profile_image）を記述する

  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
end
