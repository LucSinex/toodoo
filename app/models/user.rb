class User < ActiveRecord::Base
	acts_as_authentic do |config|
		config.crypto_provider = Authlogic::CryptoProviders::BCrypt
	end
	has_many :lists, dependent: :destroy
end
