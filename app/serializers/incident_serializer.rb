class IncidentSerializer < ActiveModel::Serializer
  attributes :id, :description, :incident_type, :lines_affected
end
