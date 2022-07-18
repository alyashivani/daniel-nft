CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     "hello",
    aws_secret_access_key: "builderai",
    region:                "us-east-1",                  
    host:                  'minio.b80370.dev.us-east-1.aws.svc.builder.cafe',              
    endpoint:              "https://minio.b80370.dev.us-east-1.aws.svc.builder.cafe",
    path_style:         true                             
  }
  config.fog_directory  = "sbucket"
  config.storage = :fog
end