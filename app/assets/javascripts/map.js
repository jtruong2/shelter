var tempMarkers = [];
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
  var image = {
    url: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
    size: new google.maps.Size(20, 32),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(0, 32)
  };

  var shape = {
    coords: [1, 1, 1, 20, 18, 20, 18, 1],
    type: 'poly'
  };

  for (var i = 0; i < properties.length; i++) {
    var property = properties[i];
    var marker = new google.maps.Marker({
      position: {lat: property[0], lng: property[1]},
      map: map,
      icon: image,
      shape: shape,
    });
    tempMarkers.push(marker);
  }
  var markerCluster = new MarkerClusterer(map, tempMarkers,
    {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
}
