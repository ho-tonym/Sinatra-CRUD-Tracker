require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

require_all 'app'

#bundle init
#touch config.ru
#make environment file
#add gems, run bundle
