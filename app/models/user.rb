class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :email_domain

  def email_domain
    if !self.email.ends_with?('@sistemadefrete.com.br')
      errors.add(:email, 'precisa ter o domínio @sistemadefrete.com.br')
    end
  end

  def description
  "#{name} - #{email}"
  end
end
