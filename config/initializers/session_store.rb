# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bills_session',
  :secret      => '690d4f49bee17ea5c87fbf0217f9b80c0d3014d56f80d452b6d5317cb4a7f96fce6db72dc5102a4b3546f145b841ec97888d3e737ea01aaefad3e4cbc60e6c77'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
