class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.create_model_array(id)
    admin = AdminUser.find(id).create_model
    create_model_array =[]
    if !admin.nil? && admin.present?
      create_model_array = admin.map{|n|eval n}.reject(&:blank?)
    end

    return create_model_array
  end

  def self.delete_model_array(id)

    admin = AdminUser.find(id).delete_model
    delete_model_array =[]
    if !admin.nil? && admin.present?
      delete_model_array = admin.map{|n|eval n}.reject(&:blank?)
    end

    return delete_model_array
  end

  def self.read_model_array(id)

    admin = AdminUser.find(id).read_model
    read_model_array =[]
    if !admin.nil? && admin.present?
      read_model_array = admin.map{|n|eval n}.reject(&:blank?)
    end

    return read_model_array
  end
  
  def self.update_model_array(id)

    admin = AdminUser.find(id).update_model
    update_model_array =[]
    if !admin.nil? && admin.present?
      update_model_array = admin.map{|n|eval n}.reject(&:blank?)
    end

    return update_model_array
  end
end
