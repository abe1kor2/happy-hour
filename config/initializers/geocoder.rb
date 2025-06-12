Geocoder.configure(
  # Geocoding service timeout (secs)
  timeout: 10,

  # Name of geocoding service (symbol)
  lookup: :nominatim,

  # Calculation options
  units: :km, # :km for kilometers or :mi for miles
)
