class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :client, uniqueness: { scope: :gym }
    #A client can have only one membership with gym

end
