MangoPay.configure do |c|
  c.preproduction = true
  c.client_id = ENV["MANGO_PAY_CLIENT_ID"]
  c.client_passphrase = ENV['MANGO_PAY_PASSPHRASE']
end
