# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  Cat.create!("name"=>"Muffins", "birth_date" => "2013/02/01",
              "color"=>"red", "sex"=>"M", :user_id => 1)

  Cat.create!("name"=>"Star", "birth_date" => "2012/05/01",
            "color"=>"black", :user_id => 1)

  Cat.create!("name"=>"Elsie", "birth_date" => "2013/04/23",
              "color"=>"brown", "sex"=>"F", :user_id => 1)

  CatRentalRequest.create!(:cat_id => 1,
                           :start_date => "2013/01/01",
                           :end_date => "2013/02/01",
                           :status => "APPROVED")

  User.create!(:user_name => "George Washington", :password => "america")

  #
  # CatRentalRequest.create!(:cat_id => 1,
  #                          :start_date => "2013/01/07",
  #                          :end_date => "2013/05/01",
  #                          :status => "APPROVED")

end