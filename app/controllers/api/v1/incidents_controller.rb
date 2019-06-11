require 'update_db'

class Api::V1::IncidentsController < ApplicationController

  def index
    update_incidents_if_necessary
    render json: IncidentUpdate.last.incidents
  end

  private

  def update_incidents_if_necessary
    def incidents_need_update?
      #returns true if incidents don't exist, or if they are too old.
      return !!(IncidentUpdate.count == 0) || (DateTime.now.to_time - IncidentUpdate.last.created_at.to_time > 60)
    end

    if incidents_need_update?
      #destroys all incident updates and pulls new incident data from wmata
      IncidentUpdate.all.destroy_all
      new_incident_update = IncidentUpdate.create()

      UpdateDb.incidents_data.each do |incident|
        new_incident = Incident.create(
          description: incident["Description"],
          incident_type: incident["IncidentType"],
          lines_affected: incident["LinesAffected"])
          new_incident_update.incidents << new_incident
      end
    end
  end

end
