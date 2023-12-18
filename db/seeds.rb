# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

p "is destroying- articles: #{Article.all.count} - users: #{User.all.count}"
Article.all.each do |article|
  article.photo.purge
end
User.destroy_all
Article.destroy_all

p "remaining- articles: #{Article.all.count} - users: #{User.all.count}"


frodon = User.new(email: 'frodon@gmail.com', password: 'password', username: 'frodon')
file = URI.open("https://static.wikia.nocookie.net/lotr/images/3/32/Frodo_%28FotR%29.png/revision/latest?cb=20221006065757")
frodon.photo.attach(io: file, filename: "frodon", content_type: 'image/jpg')
frodon.save

user = User.new(email: 'john@example.com', password: 'usermdp')
user.save


langosta = Article.new(
  user: frodon,
	title: "La langouste, un crustacé passionant",
	description: 'Un article sur la vie des langoustes : exploration des profondeurs de sa vie marine',
	content: "Au sein des fonds marins, la langouste émerge comme un sujet de recherche aussi peu palpitant que les sédiments au fond de l'océan.
  Les biologistes marins, animés par un zèle étonnant pour l'insignifiance, ont entrepris une étude inintéressante pour décortiquer les habitudes monotones de la langouste.
  La langouste, avec son exosquelette terne et ses mouvements peu gracieux au fond de l'océan, résiste à toute tentative de fascination. Les chercheurs, armés de leur ennui, ont observé les habitudes comportementales monotones de ces crustacés, constatant qu'ils passent la majeure partie de leur existence à errer sans but apparent, aussi inintéressants que les rochers sur lesquels ils se cachent.
  Les tentatives d'épicer cette étude morne en explorant la biologie de la langouste n'ont fait qu'ajouter une couche supplémentaire d'ennui à l'ensemble. Leurs mécanismes d'accouplement et de mue, bien que fascinants pour les biologistes marins les plus intrépides, ne réussissent pas à susciter le moindre intérêt chez le commun des mortels.
  En résumé, la langouste se distingue comme un sujet de recherche d'une banalité abyssale. Son existence marine, aussi peu stimulante que la contemplation des algues marines, souligne l'aspect terne de la vie sous-marine. Cette investigation sans intérêt n'apporte rien à notre compréhension du monde marin, si ce n'est une confirmation de l'indifférence omniprésente qui entoure la vie monotone de la langouste.",
	publication_date: "2022-01-12"
	)
file = URI.open("https://www.fishipedia.fr/wp-content/uploads/2022/09/Palinurus-elephas-2-725x483.jpg")
langosta.photo.attach(io: file, filename: "langosta.png", content_type: "image/jpg")
langosta.save!

buttonwar = Article.new(
  user: frodon,
	title: "L'urgence d'un soutien humanitaire lors de la guerre des boutons",
	description: 'Un article qui relate les dernières évolutions de la guerre des boutons',
	content: "Avec le soutien stratégique crucial de la Belgique et de l'Italie, les États-Unis ont donné le feu vert à une opération majeure dans la guerre des boutons.
  Nous espérons que cette avancée marque le début d'une coalition internationale, de deux à trois cents élèves, prêts à défendre l'honneur de leur boutonnière. Sans sombrer dans le pessimisme, il semble que l'adversaire ait tiré des leçons de ses précédentes défaites, relançant son complexe industriel du bouton et acquérant des compétences dans le maniement de nouveaux types de boutons.
  La France, et son général Tigibus, a réussi à trouver de nouveaux fournisseurs de boutons à l'international. La livraison imminente de boutons sophistiqués par l'Italie et l'Allemagne nous inquiète particulièrement.
  Alors que les États-Unis dirigent la coalition Buttonham [réunion prévue à la salle de classe de Mme Dupont le 26 avril 2023], nous appelons le président l'Aztec à lever les restrictions sur l'utilisation des boutons fournis par son pays et à encourager les membres de la coalition à faire de même. Ainsi, les forces de la cour de récréation pourront neutraliser en profondeur les structures et les équipements boutonneux ennemis, les caches de boutons et les usines du complexe industriel boutonneux russe. La guerre des boutons atteint de nouveaux sommets, et l'avenir de la cours de récréation dépend de notre capacité à appuyer sur le bon bouton au bon moment.",
	publication_date: "2023-04-26"
	)
file = URI.open("https://jeunepublic.veocinemas.fr/wp-content/uploads/2020/12/photo-film-La-guerre-des-boutons.jpg")
buttonwar.photo.attach(io: file, filename: "buttonwar.png", content_type: "image/jpg")
buttonwar.save!

p "created- articles: #{Article.all.count} - users:#{User.all.count}"
