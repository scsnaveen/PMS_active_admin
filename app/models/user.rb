class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable,:confirmable,:lockable,:trackable
   validates :lastname, presence: true,length: { minimum: 5 },format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
   validates :name,format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
   validates :uname,presence: true
   validates :phonenumber,numericality: { only_integer: true },presence: true
   belongs_to :organization
   has_many :projects
   mount_uploader :attachment, AvatarUploader
     
end
