require 'openssl'

class String
  def encrypt(key)
    cipher = OpenSSL::Cipher::AES.new(128, :CBC).encrypt
    cipher.key = key
    cipher.update(self) + cipher.final
  end

  def decrypt(key)
    cipher = OpenSSL::Cipher::AES.new(128, :CBC).decrypt
    cipher.key = key
    cipher.update(self) + cipher.final
  end
end

keygen = OpenSSL::Cipher::AES.new(128, :CBC).encrypt
key = keygen.random_key

p encrypted = "Secret Message".encrypt(key)
p encrypted.decrypt(key)            # => Secret Message
