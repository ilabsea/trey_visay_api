# frozen_string_literal: true
namespace :db do
  desc 'prepare to run the test'
  task prepare_for_test: :environment do
    sh 'rake db:drop RAILS_ENV=test'
    sh 'rake db:create RAILS_ENV=test'
    sh 'rake db:migrate RAILS_ENV=test'
  end
end
