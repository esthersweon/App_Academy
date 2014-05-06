require 'singleton'
require 'sqlite3'

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Casablanca"; order by the
# actor's name.
def casablanca_cast
  MovieDatabase.execute(<<-SQL)
  SELECT actor.name
  FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON casting.movieid = movie.id
  WHERE movie.title = "Casablanca"
  ORDER BY actor.name
SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
  SELECT movie.title
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = "Harrison Ford"
  ORDER BY movie.title
SQL
end

# 3. List the films where 'Harrison Ford' has appeared, but not in the
# star role. Order by movie title.
def harrison_ford_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
  SELECT movie.title 
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = "Harrison Ford" AND ord != 1
  ORDER BY movie.title
SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
  SELECT movie.title, actor.name
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
  WHERE ord = 1 AND yr = 1962
  ORDER BY movie.title
SQL
end

# 5. Which were the busiest years for 'John Travolta'? List the year
# and the number of movies he made each year, for any year in which he
# made >2 movies. Order by year.
def busiest_john_travolta_years
  MovieDatabase.execute(<<-SQL)
  SELECT yr, COUNT(*) count
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
  WHERE actor.name = "John Travolta"
  GROUP BY yr
  HAVING COUNT(*) > 2
  ORDER BY yr

SQL
end

# 6. List the film title and the leading actor for all of the films
# 'Julie Andrews' played in. Order by movie title name. Be careful!
# There is a movie (Pink Panther) in which Julie Andrews appears in
# two roles; do not double count the star of that film (Peter
# Sellers).
def julie_andrews_stars
  MovieDatabase.execute(<<-SQL)
  SELECT DISTINCT movie.title, actor.name
   FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
   WHERE ord = 1 AND title IN (
    SELECT title
     FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
     WHERE actor.name = "Julie Andrews")
   ORDER BY movie.title
SQL
end

# 7. Obtain a list in alphabetical order of actors who've had >=30
# starring roles. Order by actor name.
def biggest_stars
  MovieDatabase.execute(<<-SQL)
  SELECT actor.name, COUNT(*) count
  FROM actor JOIN casting ON actor.id = casting.actorid JOIN movie ON casting.movieid = movie.id
  WHERE ord = 1
  GROUP BY actor.name
  HAVING COUNT(*)>=30 
  ORDER BY ACTOR.NAME
SQL
end
