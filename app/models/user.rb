class User < ApplicationRecord
	attr_accessor :gauth_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :google_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable,:confirmable,:lockable,:trackable
   validates :lastname, presence: true,length: { minimum: 5 },format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
   validates :name,format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
   validates :uname,presence: true
   validates :phonenumber,numericality: { only_integer: true },presence: true
   belongs_to :organization
   has_many :projects
   has_one :attachment
   mount_uploader :attachment, AvatarUploader
   # has_one :role
     # enum role:[:admin,:superadmin,:user]
     
end
