require 'csv'
namespace :stories do
   desc "Generate CSV of stories with its synopsis"
   task :export_csv, [:languages] => :environment do |t, args|
        language_names = args[:languages].split(",")
        languages = Language.where(name: language_names)
        file = "#{Rails.root}/public/test.csv"
       CSV.open(file, "w") do |rows|
        languages.each do |language|
            stories = language.stories.published
            rows << [language.name]
            rows << ["Id", "Title", "Synopsis", "Content"]

            stories.each do |story|
                row = []
                row << story.id
                row << story.title
                row << story.synopsis
                story.pages.each do |page|
                    row << ActionController::Base.helpers.strip_tags(page.content.gsub!(/[!|;:,.?']/, '')) if page.content
                end
                rows << row
            end
            rows << []
        end
       end
   end
end