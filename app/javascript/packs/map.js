import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import swal from 'sweetalert';

const mapElement = document.getElementById('map');
const markers = JSON.parse(mapElement.dataset.markers);
let user;
if (document.querySelector('#map').dataset.user !== "") {
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


  // adding markers to map
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  });

  if (document.querySelector('#map').dataset.user !== "") {

    map.setZoom(12.5);
    map.setCenter([user.lng, user.lat]);

    new mapboxgl.Marker({color: '#d01736'})
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

  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
    }));
}
