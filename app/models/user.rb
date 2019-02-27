class User < ApplicationRecord
    validates :first_name, presence: true
    validates :email, presence: true

    has_many :addresses
    accepts_nested_attributes_for :addresses, reject_if: :all_blank
end
