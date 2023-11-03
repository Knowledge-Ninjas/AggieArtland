// describe('Map Functions', function () {
//     beforeEach(function () {
//         console.log("james");
//       setFixtures('<div id="lat"></div><div id="long"></div><div id="acc"></div>');
//     });
  
//     describe('init', function () {
//       it('should set latitude and longitude', function () {
//         spyOn(navigator.geolocation, 'getCurrentPosition').and.callFake(function (success) {
//           success({
//             coords: {
//               latitude: 42.123,
//               longitude: -75.456,
//               accuracy: 10
//             }
//           });
//         });

//         console.log("HJajhfbdsu");
  
//         init();
  
//         expect(document.getElementById('lat').textContent).toBe('42.123');
//         expect(document.getElementById('long').textContent).toBe('-75.456');
//       });
  
//       it('should set accuracy', function () {
//         spyOn(navigator.geolocation, 'getCurrentPosition').and.callFake(function (success) {
//           success({
//             coords: {
//               latitude: 42.123,
//               longitude: -75.456,
//               accuracy: 10
//             }
//           });
//         });
  
//         init();
  
//         expect(document.getElementById('acc').textContent).toBe('10');
//       });
//     });
  
//     describe('initMap', function () {
//       it('should initialize the map', function () {
//         spyOn(navigator.geolocation, 'getCurrentPosition').and.callFake(function (success) {
//           success({
//             coords: {
//               latitude: 42.123,
//               longitude: -75.456,
//               accuracy: 10
//             }
//           });
//         });
  
//         initMap();
  
//         // Here, you can use Jasmine spies or other methods to check if the Google Maps API is called correctly
//         // For example, you can spy on the `new google.maps.Map` and `new google.maps.Marker` functions.
//         // Then, expect these spies to have been called with the expected arguments.
//         // This requires additional setup for mocking the Google Maps API.
  
//         // Example (this requires additional setup):
//         // spyOn(google.maps, 'Map');
//         // spyOn(google.maps, 'Marker');
//         // expect(google.maps.Map).toHaveBeenCalled();
//         // expect(google.maps.Marker).toHaveBeenCalled();
//       });
//     });
//   });
  

window.google = {
  maps: {
    Map: function () {},
    Marker: function () {},
  },
};

describe('Art Pieces Data', function () {
  it('should define and contain art pieces data', function () {
    // Check if artPieces is defined
    expect(typeof artPieces).toBe('object');

    // Check if artPieces contains some expected properties
    expect(artPieces.length).toBeGreaterThan(0);
    expect(artPieces[0].name).toBeDefined();
    expect(artPieces[0].latitude).toBeDefined();
    expect(artPieces[0].longitude).toBeDefined();
    // Add more expectations as needed
  });
});

describe('Map Functions', function () {
  let latElement, longElement, accElement;

  beforeEach(function () {
    // Create DOM elements for testing
    latElement = document.createElement('div');
    latElement.id = 'lat';
    document.body.appendChild(latElement);

    longElement = document.createElement('div');
    longElement.id = 'long';
    document.body.appendChild(longElement);

    accElement = document.createElement('div');
    accElement.id = 'acc';
    document.body.appendChild(accElement);
  });

  afterEach(function () {
    // Remove the created DOM elements after each test
    document.body.removeChild(latElement);
    document.body.removeChild(longElement);
    document.body.removeChild(accElement);
  });

  describe('init', function () {
    it('should set latitude and longitude', function () {
      spyOn(navigator.geolocation, 'getCurrentPosition').and.callFake(function (success) {
        success({
          coords: {
            latitude: 42.123,
            longitude: -75.456,
            accuracy: 10
          }
        });
      });

      init();

      expect(document.getElementById('lat').textContent).toBe('42.123');
      expect(document.getElementById('long').textContent).toBe('-75.456');
    });

    it('should set accuracy', function () {
      spyOn(navigator.geolocation, 'getCurrentPosition').and.callFake(function (success) {
        success({
          coords: {
            latitude: 42.123,
            longitude: -75.456,
            accuracy: 10
          }
        });
      });

      init();

      expect(document.getElementById('acc').textContent).toBe('10');
    });
  });

  describe('initMap', function () {
    it('should initialize the map', function () {
      spyOn(navigator.geolocation, 'getCurrentPosition').and.callFake(function (success) {
        success({
          coords: {
            latitude: 42.123,
            longitude: -75.456,
            accuracy: 10
          }
        });
      });

      initMap();

      // Here, you can use Jasmine spies or other methods to check if the Google Maps API is called correctly
      // For example, you can spy on the `new google.maps.Map` and `new google.maps.Marker` functions.
      // Then, expect these spies to have been called with the expected arguments.
      // This requires additional setup for mocking the Google Maps API.

      // Example (this requires additional setup):
      // spyOn(google.maps, 'Map');
      // spyOn(google.maps, 'Marker');
      // expect(google.maps.Map).toHaveBeenCalled();
      // expect(google.maps.Marker).toHaveBeenCalled();
    });
  });
});
