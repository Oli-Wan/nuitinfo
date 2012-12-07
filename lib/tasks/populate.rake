# encoding: utf-8

namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke

    make_tags
    make_monuments
    make_gastro

  end

  def make_tags

    Tag.create!(name: "Art")
    Tag.create!(name: "Bibliothèques")
    Tag.create!(name: "Gastronomie")
    Tag.create!(name: "Monuments")
    Tag.create!(name: "Musées")
    Tag.create!(name: "Évènements")

  end

  def make_monuments

    monumentTag = Tag.find_by_name("Monuments")
    eventTag = Tag.find_by_name("Évènements")

    # Notre dame de Strasbourg

    item = Item.new(name: "Notre Dame de Strasbourg", 
        content: "Notre Dame de Strasbourg est la deuxième cathédrale la plus visité de France. Représentative du style gothique et du haut de ses 142 mètres, elle fut l’édifice le plus haut du monde de 1647 à 1874. Le site a été utilisé par plusieurs édifices religieux successifs depuis l’occupation romaine. En 1015, l’évêque de Strasbourg Werner de Habsbourg et l'empereur Henri II posèrent la première pierre d'une nouvelle cathédrale sur les ruines d’un édifice carolingien. De style ottonien, elle brûle en 1176. Le chantier est lancé par un nouvel évêque,  Henri de Hasenbourg et cinq maîtres d'oeuvres se succèdent. La construction débute par le chœur et le transept pour s’achever en 1439.", 
        latitude: "48.5816667", 
        longitude: "7.7505556", 
        altitude: "153", 
        content_type: "text/plain")
    item.tags << monumentTag
    item.save

    event = Item.new(name: "Construction", date: "1015-01-01")
    event.tags << eventTag
    event.parent = item
    event.save

    event = Item.new(name: "Destruction", date: "1176-01-01")
    event.tags << eventTag
    event.parent = item
    event.save

    event = Item.new(name: "Reconstruction", date: "1176-01-01", content: "{ 'start_date' : '1176-01-01', 'end_date' : '1439-01-01' }", content_type: "application/json")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "StrassburgMuenster", media_url: "http://upload.wikimedia.org/wikipedia/commons/7/79/StrassburgMuenster.jpg")
    medium.item = event
    medium.save

    event = Item.new(name: "Installation de l’orgue", date: "1716-01-01")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Orgue Cathédrale Strasbourg", media_url: "http://upload.wikimedia.org/wikipedia/commons/0/03/Orgue_-_Cathedrale_de_Strasbourg.jpg")
    medium.item = event
    medium.save

    medium = Medium.new(name: "Façade extérieure", description: "Une façade extérieure de la cathédrale", media_url: "https://umdrive.memphis.edu/g-wangcenter/www/images/Strasbourg_2007/Cathedral_Strasbourg.JPG")
    medium.item = item
    medium.save

    medium = Medium.new(name: "Nef", description: "Vue de la nef à l’intérieur de la cathédrale", media_url: "http://upload.wikimedia.org/wikipedia/commons/b/be/Absolute_Cathedrale_Strasbourg_interieur_01.JPG")
    medium.item = item
    medium.save

    medium = Medium.new(name: "Statues", description: "Des statues présentes à l’extérieur du monument", media_url: "http://upload.wikimedia.org/wikipedia/commons/d/d3/Cathedrale-de-Strasbourg-IMG_4233.jpg")
    medium.item = item
    medium.save

    # Place Kléber

    item = Item.new(name: "Place Kléber", 
      content: "Tout d’abord nommée Barfüsserplatz puis Waffenplatz, la place Kléber doit son nom à l’inauguration du mausolée à la gloire du général Jean-Baptiste Kléber. Celui-ci fut le commandant suprême de l’armée d’Égypte et fut assassiné au Caire en 1800. Au nord de la place, on trouve l’Aubette, bâtiment néo-classique construit en 1778. Celui- ci était d’abord un corps de garde à partir duquel était envoyé les ordres à l’aube, d’où son nom. Conservatoire de musique puis complexe de loisirs, l’Aubette est aujourd’hui un centre regroupant boutiques et restaurants. La place Kléber est aussi connue pour être le centre des rassemblements à Strasbourg.", 
      latitude: "48.5833333", 
      longitude: "7.746111", 
      altitude: "152", 
      content_type: "text/plain")
    item.tags << monumentTag
    item.save

    event = Item.new(name: "Inauguration", date: "1840-06-24")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Jardins Publics", media_url: "http://www.crdp-strasbourg.fr/data/albums/jardins_publics_br/img_hr/image27.jpg")
    medium.item = event
    medium.save

    event = Item.new(name: "Construction de l’aubette", date: "1778-01-01")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Place Kleber Aubette", media_url: "http://upload.wikimedia.org/wikipedia/commons/f/f2/Place_kleber-MJ.jpg")
    medium.item = event
    medium.save

    event = Item.new(name: "Enterrement de JB Kléber sous la statue", date: "1838-12-15")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Statue Jean-Baptiste Kléber", media_url: "http://upload.wikimedia.org/wikipedia/commons/0/0b/Statue_of_Jean-Baptiste_Kl%C3%A9ber_on_Place_Kl%C3%A9ber_in_Strasbourg.jpg")
    medium.item = event
    medium.save

    medium = Medium.new(name: "Noël", description: "Noël, une tradition respectée.", media_url: "Le sapin de Noël de la place Kléber en 2010 http://upload.wikimedia.org/wikipedia/commons/4/40/Le_village_de_No%C3%ABl_au_pied_du_sapin_2010.jpg")
    medium.item = item
    medium.save

    medium = Medium.new(name: "L’Aubette", description: "L’Aubette éclairée et vue de nuit.", media_url: "http://upload.wikimedia.org/wikipedia/commons/a/a9/Strasbourg_nuit_4.jpg")
    medium.item = item
    medium.save

    # Gare de Strasbourg

    item = Item.new(name: "Gare de Strasbourg-Ville", 
      content: "Inaugurée le 15 aout 1883, la gare de Strasbourg est le centre d’une importante étoile ferroviaire à cinq branches. Elle a été construite par les autorités allemandes au carrefour des grands axes internationaux Paris-Vienne et Bâle-Cologne. Le bâtiment s’étend sur deux étages et 128 mètres de long.", 
      latitude: "48.5850000", 
      longitude: "7.7344444", 
      altitude: "153", 
      content_type: "text/plain")
    item.tags << monumentTag
    item.save

    event = Item.new(name: "Travaux de rénovation", date: "2007-01-01")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Gare de Strasburg", media_url: "http://www.deviantart.com/download/200235028/gare_strasbourg_by_vemoridi-d3b7qc4.jpg")
    medium.item = event
    medium.save

    event = Item.new(name: "Arrivée du tgv", date: "2007-06-01")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Gare de Strasbourg", media_url: "http://upload.wikimedia.org/wikipedia/commons/2/22/TGV_strasbourg.jpg")
    medium.item = event
    medium.save

    # Ancienne douanne

    item = Item.new(name: "Ancienne Douane", 
      content: "L’ancienne Douane est un bâtiment situé dans la grande île de Strasbourg qui représente le coeur historique de la ville. Depuis 1948, elle est classée monument historique. Construite sous l’impulsion de la corporation des bateliers, elle avait pour but de contrôler, taxer et stocker les marchandises transitant le long du Rhin. Aujourd’hui, on y trouve une restaurant, une brasserie traditionnelle et une galerie d’exposition. Le batiement a été détruit pendant la seconde guerre mondiale et reconstruite en 1956.", 
      latitude: "48.5794444", 
      longitude: "7.7497222", 
      altitude: "151", 
      content_type: "text/plain")
    item.tags << monumentTag
    item.save

    event = Item.new(name: "Classée monument historique", date: "1948-01-01")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Ancienne Douane", media_url: "http://upload.wikimedia.org/wikipedia/commons/c/cd/Absolute_Ancienne_douane_01.JPG")
    medium.item = event
    medium.save

    event = Item.new(name: "Reconstruction de l’ancienne douane", date: "1958-01-01")
    event.tags << eventTag
    event.parent = item
    event.save
    medium = Medium.new(name: "Ancienne Douane", media_url: "http://upload.wikimedia.org/wikipedia/commons/1/19/Strasbourg_-_Ancienne_Douane.jpg")
    medium.item = event
    medium.save

  end

  def make_gastro

    gastroTag = Tag.find_by_name("Gastronomie")

    # La cloche à fromage

    item = Item.new(name: "La cloche à Fromage", 
        content: "Fromagers-affineurs, René TOURRETTE, son fils Olivier et Luc SEGAUX pérennisent la tradition du fromage. Ils vous entraînent à sa découverte et apportent la palette des saveurs fromagères jusqu’à votre table gastronomique ou votre magasin de détail spécialisé, en France et en Europe. Suivez les dans leur restaurant “La cloche à fromage”, dans leurs boutiques, au cours de leurs animations et dans leurs conférences d’information et de formation.", 
        latitude: "48.580965", 
        longitude: "7.748598", 
        altitude: "150", 
        content_type: "text/plain")
    item.tags << gastroTag
    item.save

    medium = Medium.new(name: "La cloche a fromage", description: "Un plat de fromage proposé par le restaurant", media_url: "http://pandore.daedelys.org/dionysos/Cloche%20%C3%A0%20Fromage%202011.jpg")
    medium.item = item
    medium.save

    # Buerehiesel

    item = Item.new(name: "Buerehiesel", 
        content: "Le Buerehiesel, restaurant gastronomique étoilé, est une maison typiquement alsacienne, à colombages, nichée en plein cœur du parc de l'Orangerie. Cette somptueuse maison bénéficie d'une situation exceptionnelle : à proximité des institutions et représentations européennes, entourée d'arbres centenaires et bercée par le plan d'eau adjacent. C'est un véritable havre de verdure et de paix en pleine ville.", 
        latitude: "48.591739", 
        longitude: "7.774966", 
        altitude: "150", 
        content_type: "text/plain")
    item.tags << gastroTag
    item.save

    medium = Medium.new(name: "Buerehiesel - La terrasse", description: "La terrasse du buerehiesel", media_url: "http://www.etoiles-alsace.com/images/member/le-buerehiesel/Buerehiesel-7.jpg")
    medium.item = item
    medium.save

  end

end
