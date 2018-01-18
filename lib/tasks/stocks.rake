namespace :stock do
  require 'csv'
  task :code => :environment do
    # csv에서 db생성 - 한번만
    filename = Rails.root.join('stocks.csv')
    CSV.foreach(filename) do |row|
       puts row[0]
       puts row[1]
       @stockname = row[0]
       @stockcode = row[1].to_i
       Stock.create(name: @stockname, code: @stockcode) #단수로
       # use row here...
     end
  end
end
