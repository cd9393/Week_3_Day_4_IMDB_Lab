require_relative("../db/sql_runner")

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
@id = options["id"].to_i if options["id"]
@title = options["title"]
@genre = options["genre"]
@budget = options["budget"]
end

def save()
  sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING id"
  values = [@title, @genre, @budget]
  movie = SqlRunner.run(sql, values).first
  @id = movie['id'].to_i
end

def stars
    sql = "SELECT stars.*
    FROM stars INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE movie_id = $1;"
    values = [@id]
    stars = SqlRunner.run(sql,values)
    return stars.map { |star_data| Star.new(star_data)}
  end

def budget_remaining
  sql = "SELECT castings.fee FROM castings WHERE movie_id = $1"
  values = [@id]
  fees = SqlRunner.run(sql,values)
  fee_hash_array =fees.map{|fee_data| fee_data["fee"].to_i}.reduce(0){|sum, num| sum + num}

  budget_remaining = @budget -= fee_hash_array
  return budget_remaining
end

def self.all
  sql = "SELECT * FROM movies"
  movies = SqlRunner.run(sql)
  result = movies.map{|movie| Movie.new(movie)}
  return result
end

def self.delete_all
  sql = "DELETE FROM movies"
  SqlRunner.run(sql)
end

def delete
  sql = "DELETE FROM movies WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql)
end

def update
  sql = "UPDATE movies SET (title, genre, budget) = ($1, $2, $3) WHERE id = $4"
  values = [@title, @genre, @budget, @id]
  SqlRunner.run(sql, values)
end

end
