import 'mapbox-gl/dist/mapbox-gl.css'
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
const api = document.querySelector('#map').dataset.geolocationApiKey
let yourIp = "";

// const url = `https://geo.ipify.org/api/v1?apiKey=${api}&ipAddress=${yourIp}`;

if (mapElement) { // only build a map if there's a div#map to inject into
 mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
 const map = new mapboxgl.Map({
   container: 'map',
   style: 'mapbox://styles/mapbox/streets-v10'
 });

 const markers = JSON.parse(mapElement.dataset.markers);

// Adding marker for user
  if (mapElement) {
    fetch('https://api.ipify.org?format=json').then(response => response.json())
    .then((data) => {
      console.log(data.ip);
      fetch(`https://geo.ipify.org/api/v1?apiKey=${api}&ipAddress=${data.ip}`)
      .then(response => response.json())
      .then((data) => {
        new mapboxgl.Marker()
        .setLngLat([data.location.lng, data.location.lat])
        .addTo(map);
      });
    });
  };

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  })

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

   markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  });

   if (mapElement) {
  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
    }));
  }
}
