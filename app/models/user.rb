class User < ApplicationRecord
  belongs_to  :company
  has_many    :entries
  rolify
  # Include default devise modules. Others available are:
  # :registerable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable
end
