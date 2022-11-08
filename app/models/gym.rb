class Gym < ApplicationRecord
    has_many :memberships, dependent: :destroy #for gym deliverables
    has_many :clients, through: :memberships
end
