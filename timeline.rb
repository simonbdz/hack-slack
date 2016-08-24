class Timeline

$tlpath = File.absolute_path("hack-slack/db/timeline") #ruta del archivo relativo
  
  def print #funcion para imprimir archivo de texto plano timeline
    File.open($tlpath, 'r') do |f|
        while line = f.gets
          puts line
        end
      end
  end

  def flush #Vacia el archivo de texto plano
      File.open($tlpath, 'w') do |f|
      f.puts ""
    end
  end

  def test #Imprime timeline created en el archivo de texto y borra todo lo dem'as
      File.open($tlpath, 'w') do |f|
      f.puts "timeline created"
    end
  end

  def tweet #Coloca el tweet en la ultima linea del archivo
    print "Introduzca mensaje".yellow
    tweet = gets.chomp
    puts
    File.open($tlpath, 'a') { |f|
      f.puts "@#{$user} dice: #{tweet}"
    }
  end

  def refresh #refresca hasta 
      system("cls")
        File.open($tlpath, 'r') do |f|
            while line = f.gets
              puts line.white
            end
        end
      sleep 1
      puts
      puts "t.- Enviar mensaje al canal / s.- salir / r. refrescar ".green
  end
end
