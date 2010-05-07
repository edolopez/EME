# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_EME_session',
  :secret      => 'e27c901bb40b6714e20cedf76170ab26b90ae243453c7d692e4bc5fa42d59403fec3fde2f89d0fae5e92b0d48544aee871bf5c4afb12e93f41c59dd3a1c29490'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
