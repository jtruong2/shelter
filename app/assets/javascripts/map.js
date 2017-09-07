var properties = $('#js-properties').data('properties');

function initMap() {
  var focus = {lat: properties[0][0], lng: properties[0][1]};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: focus
  });

  setMarkers(map);
}

function setMarkers(map) {
  for (var i = 0; i < properties.length; i++) {
    var property = properties[i];
    var marker = new google.maps.Marker({
      position: {lat: property[0], lng: property[1]},
      map: map
    });
  }
}
