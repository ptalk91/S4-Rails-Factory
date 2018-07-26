require 'faker'

20.times do |index|
 Part.create(
    part_number: Faker::Name.first_name
  )
  Assembly.create(
    name: Faker::Name.first_name
  )
end

# ces deux dernières commandes remplissent la table assemblies_parts 
# donne à chaque "part" un assembly aléatoire
Part.all.each do |part|
 part.assemblies.push(Assembly.all.sample)
 part.save
end

# donne à chaque assembly une part aléatoire
Assembly.all.each do |assembly|
 assembly.parts.push(Part.all.sample)
 assembly.save
end