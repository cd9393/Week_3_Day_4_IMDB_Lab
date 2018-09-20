require_relative( 'models/star' )
require_relative( 'models/movie' )
require_relative( 'models/casting' )

require( 'pry' )

Star.delete_all()
Movie.delete_all()
Casting.delete_all()

star1 = Star.new({ 'first_name' => 'Dwayne', 'last_name' => 'Johnson'})
star1.save()
star2 = Star.new({ 'first_name' => 'Robert', 'last_name' => 'Downie Jr.'})
star2.save()
star3 = Star.new({ 'first_name' => 'Neve', 'last_name' => 'Campbell'})
star3.save()

movie1 = Movie.new({ 'title' => 'Skyscraper', 'genre' => 'Action', 'budget' => 550000})
movie1.save()
movie2 = Movie.new({ 'title' => 'Iron Man 5', 'genre' => 'Action', 'budget' => 400000})
movie2.save()
movie3 = Movie.new({ 'title' => 'Scream', 'genre' => 'Horror', 'budget' => 600000})
movie3.save()

casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 100000})
casting1.save()
casting2 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => 200000})
casting2.save()
casting3 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => 300000})
casting3.save()
casting4 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star3.id, 'fee' => 150000})
casting4.save()

binding.pry
nil
