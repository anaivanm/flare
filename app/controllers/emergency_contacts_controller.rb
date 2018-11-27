class EmergencyContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    time = Time.now.to_s[11..15].split(":").join.to_i
    @emergency_contacts = EmergencyContact.where("opening <= ?", time).where("closing >= ?", time)
                          .order(:name)
    if current_user.address?
      @mapped_emergency_contacts = EmergencyContact.where("opening <= ?", time).where("closing >= ?", time)
                                .where.not(address: nil).near(current_user.address, 3)
      @user = {
        lng: current_user.longitude,
        lat: current_user.latitude,
        infoWindow: { content: render_to_string(partial: "shared/user_partial", locals: { user: @current_user }) }
      }
    else
      @mapped_emergency_contacts = EmergencyContact.where("opening <= ?", time).where("closing >= ?", time)
                                .where.not(address: nil)
    end
    @markers = @mapped_emergency_contacts.map do |contact|
      if contact.latitude && contact.longitude
        {
          lng: contact.longitude,
          lat: contact.latitude,
          infoWindow: { content: render_to_string(partial: "emergency_contacts/map_window", locals: { contact: contact }) }
        }
      end
    end
  end
end
