require 'launchy'


def make_a_quick_google_search

	abort("You need to give research terms after the command to fullfil the research purpose of this file") if ARGV.empty? 	#la fonction abort permet d'interrompre le programme si la condition if est remplie
  	
  	url = "https://www.google.com/search?q=" + ARGV.join("+")					#retourne la recherche au format demandé par google (chaque termes de la recherche séparé par un +)																						#permet de récupérer uniquement le premier élément du ARGV (qui a la classe array)

  	Launchy.open(url)

end	

make_a_quick_google_search

