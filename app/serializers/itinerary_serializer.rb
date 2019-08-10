class ItinerarySerializer < ActiveModel::Serializer
  attributes :source_code, :destination_code, :miles, :time, :peak_fare, :off_peak_fare, :senior_fare, :peak

  def peak #Calculate peak time on the back end instead of the browser.
    #Is it a weekday?
    weekday = Time.current.in_time_zone("UTC").in_time_zone("Eastern Time (US & Canada)").on_weekday?
    #Find Eastern time with daylight savings
    current_time = Time.current.in_time_zone("UTC").in_time_zone("Eastern Time (US & Canada)")
    #Determine if rush hour or not
    peaktime = (
        (current_time >= Time.find_zone("Eastern Time (US & Canada)").parse("05:00")) &&
        (current_time < Time.find_zone("Eastern Time (US & Canada)").parse("09:30"))
      ) || (
        (current_time >= Time.find_zone("Eastern Time (US & Canada)").parse("15:00")) &&
        (current_time < Time.find_zone("Eastern Time (US & Canada)").parse("19:00"))
      )
    if weekday && peaktime
      return true
    else
      return false
    end
  end

end
