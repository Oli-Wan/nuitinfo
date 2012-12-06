# encoding: utf-8

namespace :db do

  desc "Fill database with sample data"

  task populate: :environment do
    Rake::Task['db:reset'].invoke

    make_tags
    make_monuments

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
        latitude: "7.7505556", 
        longitude: "48.5816667", 
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
      latitude: "7.746111", 
      longitude: "48.5833333", 
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

  end

end
