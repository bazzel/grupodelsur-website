module GrupoHelpers

  def bookings_link
    link_to data_bookings.name, data_bookings.url
  end

  def bookings_mail
    mail_to data_bookings.email, data_bookings.contact
  end

  def bookings_phone
    phone_to data_bookings.phone
  end

  def contact_mail
    mail_to data_contact.email, data_contact.name
  end

  def contact_phone
    phone_to data_contact.phone
  end

  def coc
    "#{I18n.t(:coc)} #{data_contact.coc}"
  end

  def phone_to(phone)
    link_to phone, "tel:#{phone.gsub(/\s/, '')}"
  end

  def data_bookings
    data_config.bookings
  end

  def data_contact
    data_config.contact
  end

  def data_config
    data.config
  end
end
