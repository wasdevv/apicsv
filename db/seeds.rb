# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

# Define os cabeçalhos do CSV
headers = ['id', 'name', 'email', 'city', 'street', 'country']

# Define os valores padrão para cada coluna
name    = "Pink Panther"
email   = "pink.panther@example.com"
city    = "Pink City"
street  = "Pink Road"
country = "Pink Country"

# Abre o arquivo CSV em modo de escrita e adiciona cabeçalhos
CSV.open(Rails.root.join('db', 'seeds', 'data.csv'), 'w', write_headers: true, headers: headers) do |csv|
  # Gera 1 milhão de linhas de dados fictícios
  1_000_000.times do |i|
    csv << [i, name, email, city, street, country]
  end
end

puts "Arquivo data.csv gerado com sucesso!"