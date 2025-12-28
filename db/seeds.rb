# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
current_environment = Rails.env.downcase
puts "Current environment: #{current_environment}"
puts "Running seeds!"
start_time = Time.current
load(Rails.root.join('db', 'seeds', "#{current_environment}.rb"))
end_time = Time.current
puts "Finished seeding in #{end_time - start_time} seconds"
