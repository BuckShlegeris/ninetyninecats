require 'open-uri'

class Cat < ActiveRecord::Base

  COLOR = %w(black white brown red gray striped)

  validates :name, :birth_date, :color, :name, :user_id, :presence => true
  validates :color, :inclusion => { :in => COLOR }
  validates :sex, :inclusion => { :in => %w(M F)}, :allow_blank => true

  attr_accessible :name, :birth_date, :color, :name, :sex, :user_id

  has_many :cat_rental_requests, :dependent => :destroy

  belongs_to :owner,
        :class_name => "User",
        :primary_key => :id,
        :foreign_key => :user_id

  def age
    (Date.today - birth_date).to_i/365
  end

  def get_photo
    puts "getting photo for #{self.name}"
    sleep(4)
    page = open(
        "http://www.bing.com/images/search?q=#{self.name.split(" ").join("+")}"
            ).read

    self.url = page.scan(/src="(http:\/\/ts4.mm.bing.net\/[^>]+)/).map{|x| x[0]}.sample
  end

end