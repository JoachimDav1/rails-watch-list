puts "Start to generate"

# Ensure the existence of required records
5.times do
  list_name = nil
  loop do
    list_name = [Faker::Movie.quote, Faker::JapaneseMedia::OnePiece.quote, Faker::Locations::Australia.state,Faker::Cannabis.strain, Faker::Ancient.primordial,Faker::Adjective.negative, Faker::Adjective.positive].sample
    break unless List.exists?(name: list_name)
  end

  list = List.create!(name: list_name)

  15.times do
    movie_title = nil
    loop do
      movie_title = [Faker::Movie.title,Faker::TvShows::SouthPark.episode_name,Faker::TvShows::BreakingBad.episode, Faker::TvShows::FamilyGuy.quote].sample
      break unless Movie.exists?(title: movie_title)
    end

    movies_url = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_Kk8b7z3mb7jHSw5g61IknlhX0sjXClFW8w&s",
      "https://www.telegraph.co.uk/content/dam/women/2018/11/15/TELEMMGLPICT000180432694_trans_NvBQzQNjv4BqpVlberWd9EgFPZtcLiMQfyf2A9a6I9YchsjMeADBa08.jpeg",
      "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F02%2Flebron-james-nike-nikeland-roblox-lebron-19-chosen-1-info-1.jpg?cbr=1&q=90",
      "https://francais.n-va.be/sites/international.n-va.be/files/styles/style_cv_detail/public/generated/images/cv-picture/ka-vlb-eff-01_081-124-01-theo-francken_2.jpg?itok=tjY8172E&timestamp=1438784364",
      "https://tmssl.akamaized.net/images/foto/galerie/neymar-brazil-2023-1694521247-116480.jpg?lm=1694521259",
      "https://www.billboard.com/wp-content/uploads/2024/03/a-Ariana-Grande-cr-Katia-Temkin-02-press-2024-billboard-1548.jpg?w=942&h=623&crop=1",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Kevin_De_Bruyne_201807091.jpg/640px-Kevin_De_Bruyne_201807091.jpg",
      "https://fr.web.img2.acsta.net/medias/nmedia/18/79/51/22/19732939.jpg"
    ]

    movie = Movie.create!(
      title: movie_title,
      overview: [Faker::Quotes::Shakespeare.hamlet_quote, Faker::Quotes::Shakespeare.as_you_like_it_quote,Faker::Quotes::Shakespeare.king_richard_iii_quote, Faker::Quotes::Shakespeare.romeo_and_juliet_quote].sample,
      poster_url: movies_url.sample,
      rating: rand(0.0..10.0).round(1)
    )

    Bookmark.create!(
      movie: movie,
      list: list,
      comment: Faker::Quote.famous_last_words[0, 100]
    )
  end
end

puts "FINISHED"