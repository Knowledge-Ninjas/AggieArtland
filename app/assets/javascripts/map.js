function initMap() {
  var latitude = parseFloat(document.getElementById('lat').textContent);
  var longitude = parseFloat(document.getElementById('long').textContent);

  console.log("The lat & lang is ");
  console.log(latitude);
  console.log(longitude);

  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: latitude, lng: longitude},
    zoom: 15
  });

  var userMarker = new google.maps.Marker({
    position: {lat: latitude, lng: longitude},
    map: map,
    title: 'Your Location',
    icon: '/assets/red-dot.png'
  });

  // Assuming you have the artPieces data available as an array of objects
  console.log("Michael Schumi");
  console.log(artPieces);

  // Create an InfoWindow object for use with each art piece marker
  var infoWindow = new google.maps.InfoWindow();

  artPieces.forEach(function(artPiece) {
    var marker = new google.maps.Marker({
      position: {lat: artPiece.latitude, lng: artPiece.longitude},
      map: map,
      title: artPiece.name,
      icon: '/assets/blue-dot.png'
    });

    // Add click event listener for the marker
    marker.addListener('click', function () {
      // Create a link to the art piece's show page
      var artPieceLink = '<a href="/art_pieces/' + artPiece.id + '">View Art Piece</a>';
      var art = '<img src="assets/art_piece_icon_' + artPiece.id + '.png" style="width: 100px; height: 100px;" />';
      // Set the content of the info window with the art piece name and the link
      infoWindow.setContent(art + '<br>' + "Art Piece: " + artPiece.name + '<br>' + artPieceLink);
      infoWindow.open(map, marker);
    });
  });
}

function init() {
  navigator.geolocation.getCurrentPosition(function(position) {
      document.getElementById('lat').textContent = position.coords.latitude;
      document.getElementById('long').textContent = position.coords.longitude;
      document.getElementById('acc').textContent = position.coords.accuracy;

      // Call the initMap function after getting the geolocation data
      initMap();
  }, function(error) {
      console.error("Geolocation failed: ", error);
      // Handle geolocation failure
  });
}

// Make sure to call init() when the page loads or when it's appropriate to start the geolocation process
