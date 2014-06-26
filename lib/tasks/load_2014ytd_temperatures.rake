namespace :load_temps do
  desc "loads the temperatures for all the stations"
  task :load_all_stns => :environment do
    puts "RAKE TASK LOAD_ALL_STNS"
    # 100.times do
    #   p = Post.create(
    #     title: Faker::Company.catch_phrase,
    #     body: Faker::Lorem.paragraphs.join("\n")
    #   )
    #   100.times do
    #     c = p.comments.build( body: Faker::Lorem.paragraphs.join("\n"))
    #     r = c.replies.build(  body: Faker::Lorem.paragraphs.join("\n"))
    #     p.save!
    #   end
    end

  desc "loads one station"
  task :load_one_stn => :environment do
    puts "RAKE TASK LOAD_ONE_STN"

  end

end
