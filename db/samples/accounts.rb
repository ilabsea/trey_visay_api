# frozen_string_literal: true

account = Account.create!(
  :email => 'sokly@instedd.org',
  :password => '123456',
  :password_confirmation => '123456',
  :is_admin => true
)
account = Account.create!(
  :email =>'mesa@instedd.org',
  :password => '123456',
  :password_confirmation => '123456'
)
