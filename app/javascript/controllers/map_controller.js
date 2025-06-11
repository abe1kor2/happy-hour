import { Controller } from "@hotwired/stimulus"
import L from "leaflet"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    markers: Array
  }

  connect() {
    if (typeof(L) === "undefined") { return }

    this.map = L.map(this.element, {
      scrollWheelZoom: true,
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(this.map);

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = L.popup().setContent(marker.info_window_html)
      L.marker([ marker.lat, marker.lng ]).addTo(this.map).bindPopup(popup)
    })
  }

  #fitMapToMarkers() {
    if (this.markersValue.length == 0) {
      this.map.setView([47.56, -52.71], 12); // Default to St. John's, NL if no markers
      return
    }

    const bounds = new L.LatLngBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lat, marker.lng ]))
    this.map.fitBounds(bounds, { padding: [70, 70], maxZoom: 15 })
  }

  disconnect() {
    this.map.remove()
  }
}
