Geocoder.configure(
  :http_proxy => ENV['QUOTAGUARD_URL'],
  :api_key  => ENV['GOOGLE_API_KEY'],
  :timeout => 5
)