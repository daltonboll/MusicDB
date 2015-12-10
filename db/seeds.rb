# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@song_titles = ["Run Away", "Okay", "It's Okay", "It's Not Okay", "I'm Trapped", "Into The Happiness", "Speakeasy", "The Fire Goes", "Sounds Like Love", "Carry On", "I Reckon", "Meet Me Halfway", "Artpop", "Blow My Heart Up", "Starstruck", "Lean On", "Graduate", "Celebration", "Rock Your Body", "Somebody To Love", "Nothing In The Water", "Something In The Water", "Get It Together", "Killing Me Softly", "Jazzy", "Blown Away", "Blown To Pieces", "Rescue Me", "Animal I Have Become", "Dirty Dancer", "Tiny Dancer", "Slip Away", "Dancing On My Own", "Skillful", "Surrender", "Deja Vu", "Ticklish", "Gangnam Style", "Road To Heaven", "Highway To Hell", "Skinhead", "I Run To You", "Bleeding Love", "Migos", "Scared But Not Sorry", "If You Don't Wanna Try", "Sleepover", "Truthful", "Anymore", "Sorry", "Waiting For The World To Change", "Random Thoughts", "Strange Clouds"]
@num_song_titles = @song_titles.size
@booleans = [true, false]

label1 = Label.create({ name: "Interscope Records", location: "New York City" })
label2 = Label.create({ name: "Def Jam Records", location: "Los Angeles" })
label3 = Label.create({ name: "Mowtown Records", location: "Nashville" })

artist1 = Artist.create({ name: "Bobby", age: 27, homeCountry: "United States", gender: "Male", race: "Caucasian", debutYear: 2004 })
artist1_album1 = Album.create({ title: "Pretty in Pink", releaseDate: "2004", genre: "Pop", amountSold: 2000000, billboard200Peak: 10, numberOfSingles: 3 })
artist1_album2 = Album.create({ title: "Alaska", releaseDate: "2007", genre: "Rock", amountSold: 130000000, billboard200Peak: 1, numberOfSingles: 4 })
artist1_album3 = Album.create({ title: "Born and Raised", releaseDate: "2010", genre: "Pop/Rock", amountSold: 170000, billboard200Peak: 56, numberOfSingles: 2 })
artist1.albums << artist1_album1
artist1.albums << artist1_album2
artist1.albums << artist1_album3
artist1_award1 = Award.create({ title: "Album Of The Year", event: "The Grammys", dateAwarded: "2007" })
artist1_award2 = Award.create({ title: "Best Album", event: "MTV Music Awards", dateAwarded: "2007" })
artist1.awards << artist1_award1
artist1.awards << artist1_award2
artist1_album2.awards << artist1_award1
artist1_album2.awards << artist1_award2
artist1.label = label1

artist2 = Artist.create({ name: "Jacky", age: 55, homeCountry: "United States", gender: "Female", race: "African American", debutYear: 2011 })
artist2_album1 = Album.create({ title: "Woods", releaseDate: "2011", genre: "Country", amountSold: 5760000, billboard200Peak: 3, numberOfSingles: 4 })
artist2.albums << artist2_album1
artist2_award1 = Award.create({ title: "Album Of The Year", event: "The Grammys", dateAwarded: "2012" })
artist2.awards << artist2_award1
artist2_album1.awards << artist2_award1
artist2.label = label1

artist3 = Artist.create({ name: "Jimmy", age: 18, homeCountry: "France", gender: "Male", race: "Asian", debutYear: 1992 })
artist3_album1 = Album.create({ title: "Never Again", releaseDate: "1992", genre: "Jazz", amountSold: 1100000, billboard200Peak: 70, numberOfSingles: 5 })
artist3_album2 = Album.create({ title: "I Told You So", releaseDate: "1998", genre: "Blues", amountSold: 550000, billboard200Peak: 8, numberOfSingles: 2 })
artist3.albums << artist3_album1
artist3.albums << artist3_album2
artist3.label = label3

artist4 = Artist.create({ name: "Smeagle", age: 110, homeCountry: "Mordor", gender: "Male", race: "Hobbit", debutYear: 1977 })
artist4_album1 = Album.create({ title: "My Precious", releaseDate: "1977", genre: "Folk", amountSold: 5000000, billboard200Peak: 1, numberOfSingles: 4 })
artist4_album2 = Album.create({ title: "He Wantses It", releaseDate: "1978", genre: "Folk", amountSold: 4500000, billboard200Peak: 1, numberOfSingles: 4 })
artist4.albums << artist4_album1
artist4.albums << artist4_album2
artist4.label = label2

Artist.all.each do |artist|
  artist.albums.each do |album|
    number_of_songs = rand(8..14)
    number_of_songs.times do |i|
      title = @song_titles[rand(0..(@num_song_titles - 1))]
      hot100Peak = rand(1..100)
      radioPeak = rand(10000000..120000000)
      spotifyStreams = rand(10000000..220000000)
      hasMusicVideo = @booleans[rand(0..1)]
      single = @booleans[rand(0..1)]
      amountSold = rand(100000..5000000)

      song = Song.create({ title: title, billboardHot100Peak: hot100Peak, radioPlayPeak: radioPeak, spotifyStreams: spotifyStreams, hasMusicVideo: hasMusicVideo, isSingle: single, amountSold: amountSold })
      artist.songs << song
      album.songs << song
    end
  end
end
