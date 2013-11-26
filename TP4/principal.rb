#Tarea Programada 4
#Lenguajes de ProgramaciÃ³n
#David Murillo
#Andres Maroto
#Adrian Siles
#Ariel Arias



require 'sinatra'  # En este espacio se escriben las gemas de ruby que se necesitan para desarrollar el programa
require 'erb'
require 'open-uri'
require 'hpricot'
require 'rubygems';

get '/' do            # MÃ©todo que carga la pagina main 
	erb :Main
end


#Variables en las que se van a insertar los objetos encontrados con su respectivo indice
$lista_artistas = []
$NumResult = 0
$num_result = 0


#Se crea la clase que va a contener los atributos con la informaciÃ³n que se necesita
class Datos
	attr_accessor :album, :artista, :link, :costo, :imagen
end

def buscarPrecio() #funcion que buscara el precio de cada uno de los elementos en la lista que contiene cada uno de los resultados
        largo = ($lista_artistas.length)-1 #para esto, se ubica en cada uno de los objetos resultado que abria en cada posicion de la lista
        ele=0                               # y con el url que almacena, accesa la informacion del album y obtiene el html que le permite determinar si es de paga o gratis
    until ele>largo do
         elemento = $lista_artistas[ele]
         url = Hpricot(open(elemento.link))
         url.search("h4[@class]").map{|cosa1|
         filtro = Hpricot( cosa1.to_s )
         costoX = filtro.search("a[@id]").inner_html
         if costoX.downcase=="free download"
                        $lista_artistas[ele].costo="Gratis"
                 else
                        $lista_artistas[ele].costo="Paga"
                 end
         }
         ele+=1
      end
    cantidad = $lista_artistas.length
    ver_resultados (cantidad)
end

def Iniciarbusqueda(link) # funcion que buscara en el un html que se convierte en una lista, que luego 
	pagina = Hpricot(open(link)) # se buscara la etiqueta li[@class='item'] que determina donde se ubica determinada informacion
	puts pagina                     # en este caso la informacion de cada resultado de la busqueda por el tag
    pagina.search("li[@class='item']").map{
    |elemento|                
    encontrado = Hpricot( elemento.to_s ) 
    artista = encontrado.search("div[@class='itemsubtext']").inner_html 
    album = encontrado.at("a[@href]")['title']           
    link = encontrado.at("a[@href]")['href']               
    image = encontrado.search("div").at("img[@class]")['src']  
    artistas = Datos.new()               
    artistas.album=album
    artistas.artista=artista
    artistas.link=link
    artistas.imagen=image
    artistas.costo=""
    $lista_artistas << artistas
    }
    $lista_artistas=$lista_artistas[0..9]
    $lista_artistas.compact
    buscarPrecio()
end

def buscarDatos(vartag) 
		vartag=vartag.chomp
		vartag=vartag.chomp.gsub(" ","-")
		link = ("http://bandcamp.com/tag/"+vartag)
		Iniciarbusqueda(link)
end

	def ver_resultados (cant_result)    
			if cant_result == 9
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = $lista_artistas[$num_result].imagen			
				$group5 = $lista_artistas[$num_result].artista
				$album5 = $lista_artistas[$num_result].album
				$costo5 = $lista_artistas[$num_result].costo
				$link5 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen6 = $lista_artistas[$num_result].imagen			
				$group6 = $lista_artistas[$num_result].artista
				$album6 = $lista_artistas[$num_result].album
				$costo6 = $lista_artistas[$num_result].costo
				$link6 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen7 = $lista_artistas[$num_result].imagen
				$group7 = $lista_artistas[$num_result].artista
				$album7 = $lista_artistas[$num_result].album
				$costo7 = $lista_artistas[$num_result].costo
				$link7 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen8 = $lista_artistas[$num_result].imagen
				$group8 = $lista_artistas[$num_result].artista
				$album8 = $lista_artistas[$num_result].album
				$costo8 = $lista_artistas[$num_result].costo
				$link8 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen9 = $lista_artistas[$num_result].imagen
				$group9 = $lista_artistas[$num_result].artista
				$album9 = $lista_artistas[$num_result].album
				$costo9 = $lista_artistas[$num_result].costo
				$link9 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""
			
			
			elsif cant_result == 8
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = $lista_artistas[$num_result].imagen			
				$group5 = $lista_artistas[$num_result].artista
				$album5 = $lista_artistas[$num_result].album
				$costo5 = $lista_artistas[$num_result].costo
				$link5 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen6 = $lista_artistas[$num_result].imagen			
				$group6 = $lista_artistas[$num_result].artista
				$album6 = $lista_artistas[$num_result].album
				$costo6 = $lista_artistas[$num_result].costo
				$link6 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen7 = $lista_artistas[$num_result].imagen
				$group7 = $lista_artistas[$num_result].artista
				$album7 = $lista_artistas[$num_result].album
				$costo7 = $lista_artistas[$num_result].costo
				$link7 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen8 = $lista_artistas[$num_result].imagen
				$group8 = $lista_artistas[$num_result].artista
				$album8 = $lista_artistas[$num_result].album
				$costo8 = $lista_artistas[$num_result].costo
				$link8 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""
			
			elsif cant_result == 7
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = $lista_artistas[$num_result].imagen			
				$group5 = $lista_artistas[$num_result].artista
				$album5 = $lista_artistas[$num_result].album
				$costo5 = $lista_artistas[$num_result].costo
				$link5 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen6 = $lista_artistas[$num_result].imagen			
				$group6 = $lista_artistas[$num_result].artista
				$album6 = $lista_artistas[$num_result].album
				$costo6 = $lista_artistas[$num_result].costo
				$link6 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen7 = $lista_artistas[$num_result].imagen
				$group7 = $lista_artistas[$num_result].artista
				$album7 = $lista_artistas[$num_result].album
				$costo7 = $lista_artistas[$num_result].costo
				$link7 = $lista_artistas[$num_result].link
				$num_result+=1
		
				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""



			elsif cant_result == 6
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = $lista_artistas[$num_result].imagen			
				$group5 = $lista_artistas[$num_result].artista
				$album5 = $lista_artistas[$num_result].album
				$costo5 = $lista_artistas[$num_result].costo
				$link5 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen6 = $lista_artistas[$num_result].imagen			
				$group6 = $lista_artistas[$num_result].artista
				$album6 = $lista_artistas[$num_result].album
				$costo6 = $lista_artistas[$num_result].costo
				$link6 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen7 = ""
				$group7 = ""
				$album7 = ""
				$costo7 = ""
				$link7 = ""
			

				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""


			elsif cant_result == 5
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = $lista_artistas[$num_result].imagen			
				$group5 = $lista_artistas[$num_result].artista
				$album5 = $lista_artistas[$num_result].album
				$costo5 = $lista_artistas[$num_result].costo
				$link5 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen6 = ""			
				$group6 = ""
				$album6 = ""
				$costo6 = ""
				$link6 = ""
		

				$imagen7 = ""
				$group7 = ""
				$album7 = ""
				$costo7 = ""
				$link7 = ""
			

				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""
		
			elsif cant_result == 4
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = ""			
				$group5 = ""
				$album5 = ""
				$costo5 = ""
				$link5 = ""
			
			
				$imagen6 = ""			
				$group6 = ""
				$album6 = ""
				$costo6 = ""
				$link6 = ""
		

				$imagen7 = ""
				$group7 = ""
				$album7 = ""
				$costo7 = ""
				$link7 = ""
			

				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""

			elsif cant_result == 3
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen4 = ""			
				$group4 = ""
				$album4 = ""
				$costo4 = ""
				$link4 = ""
			
			
				$imagen5 = ""			
				$group5 = ""
				$album5 = ""
				$costo5 = ""
				$link5 = ""
			
			
				$imagen6 = ""			
				$group6 = ""
				$album6 = ""
				$costo6 = ""
				$link6 = ""
		

				$imagen7 = ""
				$group7 = ""
				$album7 = ""
				$costo7 = ""
				$link7 = ""
			

				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""

			elsif cant_result == 2
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen3 = ""			
				$group3 = ""
				$album3 = ""
				$costo3 = ""
				$link3 = ""
			
			
				$imagen4 = ""			
				$group4 = ""
				$album4 = ""
				$costo4 = ""
				$link4 = ""
			
			
				$imagen5 = ""			
				$group5 = ""
				$album5 = ""
				$costo5 = ""
				$link5 = ""
			
			
				$imagen6 = ""			
				$group6 = ""
				$album6 = ""
				$costo6 = ""
				$link6 = ""
		

				$imagen7 = ""
				$group7 = ""
				$album7 = ""
				$costo7 = ""
				$link7 = ""
			

				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""


			elsif cant_result == 1
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen2 = ""			
				$group2 = ""
				$album2 = ""
				$costo2 = ""
				$link2 = ""
			
			
				$imagen3 = ""			
				$group3 = ""
				$album3 = ""
				$costo3 = ""
				$link3 = ""
			
			
				$imagen4 = ""			
				$group4 = ""
				$album4 = ""
				$costo4 = ""
				$link4 = ""
			
			
				$imagen5 = ""			
				$group5 = ""
				$album5 = ""
				$costo5 = ""
				$link5 = ""
			
			
				$imagen6 = ""			
				$group6 = ""
				$album6 = ""
				$costo6 = ""
				$link6 = ""
		

				$imagen7 = ""
				$group7 = ""
				$album7 = ""
				$costo7 = ""
				$link7 = ""
			

				$imagen8 = ""
				$group8 = ""
				$album8 = ""
				$costo8 = ""
				$link8 = ""
		

				$imagen9 = ""
				$group9 = ""
				$album9 = ""
				$costo9 = ""
				$link9 = ""
			
				$imagen10 = ""
				$group10 = ""
				$album10 = ""
				$costo10 = ""
				$link10 = ""

		else
		
		
				$imagen1 = $lista_artistas[$num_result].imagen			
				$group1 = $lista_artistas[$num_result].artista
				$album1 = $lista_artistas[$num_result].album
				$costo1 = $lista_artistas[$num_result].costo
				$link1 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen2 = $lista_artistas[$num_result].imagen
				$group2 = $lista_artistas[$num_result].artista
				$album2 = $lista_artistas[$num_result].album
				$costo2 = $lista_artistas[$num_result].costo
				$link2 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen3 = $lista_artistas[$num_result].imagen
				$group3 = $lista_artistas[$num_result].artista
				$album3 = $lista_artistas[$num_result].album
				$costo3 = $lista_artistas[$num_result].costo
				$link3 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen4 = $lista_artistas[$num_result].imagen			
				$group4 = $lista_artistas[$num_result].artista
				$album4 = $lista_artistas[$num_result].album
				$costo4 = $lista_artistas[$num_result].costo
				$link4 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen5 = $lista_artistas[$num_result].imagen			
				$group5 = $lista_artistas[$num_result].artista
				$album5 = $lista_artistas[$num_result].album
				$costo5 = $lista_artistas[$num_result].costo
				$link5 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen6 = $lista_artistas[$num_result].imagen			
				$group6 = $lista_artistas[$num_result].artista
				$album6 = $lista_artistas[$num_result].album
				$costo6 = $lista_artistas[$num_result].costo
				$link6 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen7 = $lista_artistas[$num_result].imagen
				$group7 = $lista_artistas[$num_result].artista
				$album7 = $lista_artistas[$num_result].album
				$costo7 = $lista_artistas[$num_result].costo
				$link7 = $lista_artistas[$num_result].link
				$num_result+=1

				$imagen8 = $lista_artistas[$num_result].imagen
				$group8 = $lista_artistas[$num_result].artista
				$album8 = $lista_artistas[$num_result].album
				$costo8 = $lista_artistas[$num_result].costo
				$link8 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen9 = $lista_artistas[$num_result].imagen
				$group9 = $lista_artistas[$num_result].artista
				$album9 = $lista_artistas[$num_result].album
				$costo9 = $lista_artistas[$num_result].costo
				$link9 = $lista_artistas[$num_result].link
				$num_result+=1
			
				$imagen10 = $lista_artistas[$num_result].imagen			
				$group10 = $lista_artistas[$num_result].artista
				$album10 = $lista_artistas[$num_result].album
				$costo10 = $lista_artistas[$num_result].costo
				$link10 = $lista_artistas[$num_result].link
			
		
		end
	end




post '/param_busqueda' do  # MÃ©todo que llama a la funciÃ³n que realiza la bÃºsqueda, capta el tag de busqueda y abre la pagina de resultados
	$lista_artistas = []
	$num_result = 0
	tag = params[:campo].to_s	
	buscarDatos(tag)
	redirect '/result'
		
end


get '/fail' do   # MÃ©todo que carga la pagina de fail
  erb :'Fail'
end



	
get '/result' do   # MÃ©todo que redirecciona a la pag de resultados en donde se muestran las imagenes.
	erb :resultados
	
end
