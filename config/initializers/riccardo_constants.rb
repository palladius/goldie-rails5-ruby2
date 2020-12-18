# AAA. Be sure to restart your server when you modify this file.

#Septober::Application.config.session_store :cookie_store, :key => '_septober_session'
#RicAddons.yellow('Adding to this app (probly septober) the Searchable as for AdvancedRailsRecipes.24')
#ActiveRecord::Base.extend SearchableCopy

$APP = {
  :name        => '[TEMPLATE] Goldie_Rails (you probably want to change me in config/initializers/riccardo_constants.rb)',
  :headline    => '[TEMPLATE] This is my Headline for app. (config/initializers/riccardo_constants.rb)',
  :history     => File.open("#{Rails.root}/HISTORY" ).read ,  # RAILS_ROOT
  :version     => File.open("#{Rails.root}/VERSION" ).read ,  # RAILS_ROOT
  :copyright   => 'Copyright 2018-20 A few rights reserved (see LICENSE)',
  :email       => 'riccardo.carle' + 'sso+goldie521@gmail.com',
  :author_name => 'Riccardo Carlesso',
  :is_template => true, # change to false
}

$APP[:license] = File.open("#{Rails.root}/LICENSE" ).read rescue "No /LICENSE file found. Please add it to the root directory and Ill load it automatically for you ;)"
$APP[:author] = "#{$APP[:author_name]} <#{$APP[:email]}>"
$app_name = $APP[:name]
