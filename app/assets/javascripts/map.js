function initMap() {
    var latitude = parseFloat(document.getElementById('lat').innerHTML);
    var longitude = parseFloat(document.getElementById('long').innerHTML);

    console.log("The lat & lang is ")
    console.log(latitude)
    console.log(longitude)
  
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: latitude, lng: longitude},
      zoom: 15
    });
  
    var marker = new google.maps.Marker({
      position: {lat: latitude, lng: longitude},
      map: map,
      title: 'Your Location',
      icon: {
        url: "http://maps.google.com/mapfiles/ms/icons/red-dot.png"
      }
    });

    console.log("Michael Schumi")
    console.log(artPieces);
    // Array of art pieces
    // var artPieces = <%= @art_pieces.to_json.html_safe %>;
  
    artPieces.forEach(function(artPiece) {
      new google.maps.Marker({
        position: {lat: artPiece.latitude, lng: artPiece.longitude},
        map: map,
        title: artPiece.name,
        icon: {
          url: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
        }
      });
    })
  }


  function init() {
  
  navigator.geolocation.getCurrentPosition(function(position) {
    document.getElementById('lat').textContent = position.coords.latitude;
    document.getElementById('long').textContent = position.coords.longitude;
    document.getElementById('acc').textContent = position.coords.accuracy;
  
    // Call the initMap function after getting the geolocation data
    initMap();
  });
}