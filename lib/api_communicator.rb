require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # RestClient.get()
  # JSON.parse()
  # These do work for us we don't really need to understand
  # Learn about them on your own time but don't think to hard about them at this point


  

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

  character = response_hash["results"].find {|results| results["name"] == character_name}
  character["films"].map {|film| RestClient.get(film)}

end
# binding.pry

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  info = films.map {|data| JSON.parse(data)}
  puts info.map {|arr| arr["title"]}
  # this puts is so the data we are looking for displays in the terminal
  # without puts the user could not see what data was being searched for
  # test out runing ruby bin/run.rb without the puts and see what you get
end
# binding.pry

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

# binding.pry
# 0

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
