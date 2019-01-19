require 'fileutils'
require 'git'
require 'rubygems'



#CHECK SI L'UTILISATEUR A BIEN MIS UN NOM DE DOSSIER

def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty? 		#la fonction abort permet d'interrompre le programme si la condition if est remplie. En l'occurence
end													#si ARGV est vide



# RECUPERE LE NOM DU DOSSIER

def get_folder_name
  return folder_name = ARGV.first					#permet de récupérer uniquement le premier élément du ARGV (qui a la classe array)
end



# CREE LE DOSSIER

def create_folder(name)
  Dir.mkdir(name)									
end



#CHECK LE NOM DE DOSSIER ENTRE, RECUPERE LE NOM ET LE CREE

def create_dir 										#fonction perform qui rassemble le tout
	check_if_user_gave_input						#je check d'abord si mon user a mis un input dans le ARGV
	create_folder (get_folder_name)  				#je crée ensuite le fichier en allant cherche le nom de ce dernier situé dans le ARGB
	
end

#CREATION GEMFILE

def gemfile_setup


	file = File.open("Gemfile", "w")

	file.puts("gem 'rspec'")
	file.puts("gem 'pry'")
	file.puts("gem 'rubocop', '~> 0.57.2'")
	file.puts("gem 'dotenv'")

	file.close

	path_name = get_folder_name
	FileUtils.mv "Gemfile", "#{path_name}/Gemfile"		#permet de bouger le fichier Gemfile dans le dossier créé

end




#INITIALISATION DE GIT

def initializing_git

	dir_name = get_folder_name
	Git.init("#{dir_name}")							#permet d'initier git dans le fichier créé, nécessite d'installer la gem git auparavant

end


#CREATION DE .ENV et .GITIGNORE

def creating_env_and_gitignore

	file_env = File.open("#{get_folder_name}/.env", "w")					#Création du fichier .env

	file_gitignore = File.open("#{get_folder_name}/.gitignore", "w")		#Création du fichier .gitignore

	file_gitignore.puts(".env")												#imbrication de .env dans gitignore
end


#CREATION DOSSIER LIB

def creation_lib_directory

	Dir.mkdir("#{get_folder_name}/lib")

end


#CREATION FICHIER README

def creation_readme

	file_readme = File.open("#{get_folder_name}/README.md", "w")

	file_readme.puts("Ce programme est écrit en Ruby et a été réalisé par Lionel Debauge pour The Hacking Project")
end




#INIT RESPECT AVEC LA CREATION DU DOSSIER SPEC ET DU FICHIER .RSPEC

def init_rspec

	system("rspec --init")						  #exécution des scripts entre "" dans le terminal
	system("mv spec #{get_folder_name}")
	system("mv .rspec #{get_folder_name}")

end



#METHODE FINALE REGROUPANT TOUTES LES AUTRES ET SERVANT A INITIER UN PROJET EN RUBY FACILEMENT


def perform

	create_dir
	gemfile_setup
	initializing_git
	creating_env_and_gitignore
	creation_lib_directory
	init_rspec
	creation_readme

end

perform