class RichMarkerBuilder extends Gmaps.Google.Builders.Marker #inherit from builtin builder
  #override create_marker method

	#Awesome Method for creating Text Markers.
#  create_marker: ->
#    options = _.extend @marker_options(), @rich_marker_options()
#    @serviceObject = new RichMarker options #assign marker to @serviceObject

#  rich_marker_options: ->
#    marker = document.createElement("div")
#    marker.setAttribute 'class', 'marker_container'
#    marker.innerHTML = @args.title
#    {content: marker}

#Start infobox
  # override method
  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'marker_container') #to customize
    boxText.innerHTML = @args.infowindow
    @infowindow = new InfoBox(@infobox(boxText))

    # add @bind_infowindow() for < 2.1

  infobox: (boxText)->
    content: boxText
    pixelOffset: new google.maps.Size(-140, 0)
    boxStyle:
      width: "280px"

#end infobox

@buildMap = (markers)->
	handler = Gmaps.build 'Google', { builders: { Marker: RichMarkerBuilder} } #dependency injection

	#then standard use
	handler.buildMap { provider: {}, internal: {id: 'map'} }, ->
	  markers = handler.addMarkers(markers)
	  handler.bounds.extendWith(markers)
	  handler.fitMapToBounds()

