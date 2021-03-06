CarrierWave.configure do |config|

if Rails.env.development? || Rails.env.test?
  config.storage = :file
  else
  config.fog_credentials = {
    :provider               => 'AWS',                     
    :aws_access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
    #  :region                 => 'eu-west-1',                  
  }
  config.fog_directory  = 'asudisc'                     # required
  config.fog_public     = true                              
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
end
