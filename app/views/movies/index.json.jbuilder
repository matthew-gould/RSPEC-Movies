json.array! @movies do |movie|
	json.name        movie.title
	json.rating      movie.rating
	json.description movie.description
end