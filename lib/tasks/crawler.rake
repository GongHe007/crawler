namespace :crawler do
  task :run => :environment do
    CrawlerV.run
  end
end