class ClientSerializer < ActiveModel::Serializer
  attributes :name, :age, :total #create custom method?

  has_many :memberships #relationship must be defined to what the serializer is looking for
  
  def total
    object.memberships.sum(:charge)
  end
end
#use byebug to find total. (self, object returned, then self.object or object for that client. object.memberships and then you get an array of memberships. objects.memberships.sum(:charge) then you get the total 40)