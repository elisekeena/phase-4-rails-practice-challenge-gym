class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :charge, :client_id, :gym_id
end
