import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
const markers = JSON.parse(mapElement.dataset.markers);
let user;
if (document.querySelector('#map').dataset.user !== "") {
  console.log("inside definition of variable")
  user = JSON.parse(mapElement.dataset.user);
}

if (document.querySelector('#map').dataset.user == "") {
  document.querySelector('#locate-user').click();
}

if (mapElement) { // only build a map if there's a div#map to inject into
 const api = document.querySelector('#map').dataset.geolocationApiKey
 mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
 const map = new mapboxgl.Map({
   container: 'map',
   style: 'mapbox://styles/mapbox/streets-v10'
 });

// Adding marker for user
    // fetch('https://api.ipify.org?format=json').then(response => response.json())
    // .then((data) => {
    //   console.log(data.ip);
    //   fetch(`https://geo.ipify.org/api/v1?apiKey=${api}&ipAddress=${data.ip}`)
    //   .then(response => response.json())
    //   .then((data) => {
    //     new mapboxgl.Marker()
    //     .setLngLat([data.location.lng, data.location.lat])
    //     .addTo(map);
    //   });
    // });


  // adding markers to map
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  })

  if (document.querySelector('#map').dataset.user !== "") {
    console.log("inside user conditional!")
    new mapboxgl.Marker()
      .setLngLat([user.lng, user.lat])
      .addTo(map);

    map.setZoom(12.5);
    map.setCenter([user.lng, user.lat]);

    new mapboxgl.Marker()
      .setLngLat([user.lng, user.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(user.infoWindow.content))
      .addTo(map);

  } else {
    if (markers.length === 0) {
      map.setZoom(4);
    } else if (markers.length === 1) {
      map.setZoom(14);
      map.setCenter([markers[0].lng, markers[0].lat]);
    } else {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => {
        bounds.extend([marker.lng, marker.lat]);
      });
      map.fitBounds(bounds, { duration: 0, padding: 75 })
    }
  }

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  });

  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
    }));
}
