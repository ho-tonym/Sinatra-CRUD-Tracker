require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end
# 4.2 activerecord

use Rack::MethodOverride
use SessionsController
use GazorpianController
use UserController
run ApplicationController
