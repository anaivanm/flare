class EmergencyContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    time = Time.now.to_s[11..15].split(":").join.to_i
    @emergency_contacts = EmergencyContact.where("opening <= ?", time).where("closing >= ?", time)
                          .order(:name)
    @mapped_emergency_contacts = EmergencyContact.where("opening <= ?", time).where("closing >= ?", time)
                                .where.not(address: nil)

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
