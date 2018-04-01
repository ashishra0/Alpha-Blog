# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# AWS S3
config.paperclip_defaults = {
  storage: :s3,
  s3_credentials: {
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    s3_region: ENV.fetch('AWS_REGION'),
  }
}