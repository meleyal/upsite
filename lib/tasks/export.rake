require 'csv'

namespace :export do
  desc 'export all users to a csv file'
  task :users => :environment do
    CSV.open("./user.csv", "wb") do |csv|
      csv << User.attribute_names
      User.all.each do |u|
        csv << u.attributes.values
      end
    end
  end
end
