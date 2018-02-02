# frozen_string_literal: true

account = Account.new(
  :email => 'sokly@instedd.org',
  :password => '123456',
  :password_confirmation => '123456'
)
account = Account.create!(
  :email =>'mesa@instedd.org',
  :password => '123456',
  :password_confirmation => '123456'
)