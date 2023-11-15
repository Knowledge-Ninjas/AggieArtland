function initMap() {
  var latitude = parseFloat(document.getElementById('lat').textContent);
  var longitude = parseFloat(document.getElementById('long').textContent);

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

  if (typeof artPieces !== 'undefined' && Array.isArray(artPieces)) {
    var infoWindow = new google.maps.InfoWindow();

    artPieces.forEach(function(artPiece) {
      var marker = new google.maps.Marker({
        position: {lat: artPiece.latitude, lng: artPiece.longitude},
        map: map,
        title: artPiece.name,
        icon: '/assets/blue-dot.png'
      });

      marker.addListener('click', function () {
        var artImageUrl = '/assets/art_piece_icon_' + artPiece.id + '.png';
        var defaultImageUrl = '/assets/default_art.png';

        var img = new Image();
        img.onload = function() {
          setInfoWindowContent(artImageUrl, artPiece, marker);
        };
        img.onerror = function() {
          setInfoWindowContent(defaultImageUrl, artPiece, marker);
        };
        img.src = artImageUrl;
      });
    });
  }

  function setInfoWindowContent(imageUrl, artPiece, marker) {
    var artPieceImage = '<img src="' + imageUrl + '" style="width: 100px; height: 100px;" />';
    var artPieceLink = '<a href="/art_pieces/' + artPiece.id + '">View Art Piece</a>';
    infoWindow.setContent(artPieceImage + '<br>' + "Art Piece: " + artPiece.name + '<br>' + artPieceLink);
    infoWindow.open(map, marker);
  }
}

function init() {
  navigator.geolocation.getCurrentPosition(function(position) {
    document.getElementById('lat').textContent = position.coords.latitude;
    document.getElementById('long').textContent = position.coords.longitude;
    document.getElementById('acc').textContent = position.coords.accuracy;
    initMap();
  }, function(error) {
    console.error("Geolocation failed: ", error);
  });
}
