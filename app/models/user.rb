class User < ApplicationRecord
    validates :first_name, presence: true
    validates :email, presence: true

    has_many :addresses, dependent: :destroy
    accepts_nested_attributes_for :addresses, reject_if: :all_blank

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
