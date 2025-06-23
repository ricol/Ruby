#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'openssl' # Needed for SSL connections

def get_public_ip
  services = [
    'https://api.ipify.org?format=json',
    'https://ipinfo.io/json',
    'https://ifconfig.me/all.json'
  ]

  services.each do |url|
    begin
      uri = URI(url)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        http.request(Net::HTTP::Get.new(uri))
      end
      
      if response.is_a?(Net::HTTPSuccess)
        ip_data = JSON.parse(response.body)
        return ip_data['ip'] || ip_data['ip_address'] # Different services use different keys
      end
    rescue => e
      puts "Warning: Could not get IP from #{url} - #{e.message}"
      next
    end
  end
  
  nil
end

def get_location_info(ip_address)
  services = [
    "http://ip-api.com/json/#{ip_address}",
    "https://ipinfo.io/#{ip_address}/json",
    "https://freegeoip.app/json/#{ip_address}"
  ]

  services.each do |url|
    begin
      uri = URI(url)
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
        http.request(Net::HTTP::Get.new(uri))
      end
      
      if response.is_a?(Net::HTTPSuccess)
        return JSON.parse(response.body)
      end
    rescue => e
      puts "Warning: Could not get location from #{url} - #{e.message}"
      next
    end
  end
  
  nil
end

def display_location_info(location_data, ip_address)
  if location_data
    puts "\nLocation Information:"
    puts "IP Address: #{ip_address}"
    puts "City: #{location_data['city'] || location_data['geoplugin_city'] || 'N/A'}"
    puts "Region: #{location_data['regionName'] || location_data['region'] || 'N/A'}"
    puts "Country: #{location_data['country'] || location_data['geoplugin_countryName'] || 'N/A'}"
    puts "Country Code: #{location_data['countryCode'] || location_data['country_code'] || 'N/A'}"
    puts "ISP: #{location_data['isp'] || location_data['org'] || 'N/A'}"
    puts "Latitude: #{location_data['lat'] || location_data['latitude'] || location_data['geoplugin_latitude'] || 'N/A'}"
    puts "Longitude: #{location_data['lon'] || location_data['longitude'] || location_data['geoplugin_longitude'] || 'N/A'}"
  else
    puts "Failed to retrieve location information from all services."
  end
end

begin
  puts "Fetching your IP address location..."
  
  ip_address = get_public_ip
  if ip_address.nil?
    puts "Error: Could not determine public IP address"
    exit 1
  end
  
  location_data = get_location_info(ip_address)
  display_location_info(location_data, ip_address)
  
rescue => e
  puts "A fatal error occurred: #{e.message}"
  puts e.backtrace if ENV['DEBUG']
  exit 1
end
