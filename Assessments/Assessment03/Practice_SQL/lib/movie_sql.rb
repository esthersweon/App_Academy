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

# List the films in which 'Chuck Norris' has appeared; order by movie
# title.
def bearded_films
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = 'Chuck Norris'
  ORDER BY title
  SQL
end

# Obtain the cast list for the movie "Zombies of the Stratosphere"; 
# order by the actor's name.
def zombie_cast
  MovieDatabase.execute(<<-SQL)
  SELECT name
  FROM actor JOIN casting ON casting.actorid = actor.id JOIN movie ON casting.movieid = movie.id
  WHERE movie.title = "Zombies of the Stratosphere"
  ORDER BY name
  SQL
end

# Which were the busiest years for 'Danny DeVito'? Show the year and
# the number of movies he made each year for any year in which he made
# >2 movies. Order by year. Note the 'V' is capitalized.
def biggest_years_for_little_danny
  MovieDatabase.execute(<<-SQL)
  SELECT yr, COUNT(*) count
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = "Danny DeVito"
  GROUP BY yr
  HAVING COUNT(*) > 2
  ORDER BY yr
  SQL
end

# List the films where 'Nicolas Cage' has appeared, but not in the
# star role. Order by movie title.
def more_cage_please
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = "Nicolas Cage" AND ord != 1
  ORDER BY title
  SQL
end

# List the films together with the leading star for all 1908
# films. Order by movie title.
def who_is_florence_lawrence
  MovieDatabase.execute(<<-SQL)
  SELECT title, name
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON casting.actorid = actor.id
  WHERE yr = 1908 AND ord = 1
  ORDER BY title
  SQL
end

# Obtain a list in alphabetical order of actors who've had 20
# starring roles. Order by actor name.
def twenty_roles
  MovieDatabase.execute(<<-SQL)
  SELECT name
  FROM actor JOIN casting ON casting.actorid = actor.id
  WHERE ord = 1
  GROUP BY name
  HAVING COUNT(*) = 20
  ORDER BY name 
  SQL
end


# List the film title and the leading actor for all of the films
# 'Chris Farley' played in.
def chris_is_missed
  MovieDatabase.execute(<<-SQL)
  SELECT title, actor.name
  FROM movie JOIN casting ON casting.movieid = movie.id JOIN actor ON actor.id = casting.actorid
  WHERE ord = 1 AND title IN (
    SELECT title
    FROM movie JOIN casting ON casting.movieid = movie.id
    WHERE casting.actorid = (
      SELECT id
      FROM actor
      WHERE name = 'Chris Farley'))
  SQL
end


