namespace :weather do
  require 'csv'
  task :points => :environment do
  #1.행정구역정보
  #csv에서 db생성 - 한번만
    filename = Rails.root.join('address.csv')
    CSV.foreach(filename) do |row|
       puts row[0..2].join
       puts row[3]
       puts row[4]
       @address = row[0..2].join
       @xPoint = row[3].to_i
       @yPoint = row[4].to_i
       Address.create(address: @address, nx: @xPoint, ny: @yPoint) #단수로
    end
  end
end
