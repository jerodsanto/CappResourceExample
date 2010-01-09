# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_CappResourceExample_session',
  :secret      => '48b8eb6e1f242e6914e74913752058b8d46f23481448145cb6879dd9e2bf4739dfb871784fde4fd8700864671d6ee99650542f3ac2fa8d7f334edc148419e492'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
