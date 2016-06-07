# See http://hpneo.github.io/gmaps
#
#= require './vendor/gmaps'

$ ->
  # This expect the tag to have the following data attributes:
  #  - lat
  #  - lng
  #  - name
  #  - address
  #  - city
  # @example:
  #   <div class="map" data-address="Koninklijk Park 1"
  #                    data-city="7315 JA Apeldoorn" .../>
  $('.map').each (idx) ->
    venue = $(@).data()

    map = new GMaps
      div: @
      lat: venue.lat
      lng: venue.lng

    contentString = "<div class='infoWindow'>
        <p><b>#{venue.name}</b></p>
        <p>#{venue.address}</p>
        <p>#{venue.city}</p>
      </div>"
    map.addMarker
      lat: venue.lat
      lng: venue.lng
      infoWindow:
        content: contentString
