require 'colorize'

execute = true
selection = ""
file_name = ""

check_auswahl = false

nachname = ""
vorname = ""
telefonnummer = ""

def t_auswaehlen
  puts "[Alle vorhandenen Telefonbücher]".blue
  puts Dir.glob("*.txt").map {|f| File.basename(f, ".*")}

  print "Telefonbuchname: "
  file_name = gets.chomp
  file_name = file_name + ".txt"

  if (File.file?(file_name) == true)
    "[!]".red + " #{file_name} wurde ausgewählt!"
    check_auswahl = true
  else
    file_name = ""
    "[?]".red + " #{file_name} existiert nicht!"
  end
end

def t_anlegen
  puts "[Anlegen eines neuen Telefonbuches]".blue
  print "Telefonbuchname: "
  file_name = gets.chomp
  file_name = file_name + ".txt"
  if (File.file?(file_name) == false)
    write_handler = File.new(file_name,"w")
    write_handler.close
    "[!]".magenta + " #{file_name} wurde erfolgreich erstellt!"
  else
    "[?]".red + " #{file_name} existiert bereits!"
  end
end

def t_loeschen
  puts "[Löschen eines Telefonbuches]".blue
  print "Telefonbuchname: "
  file_name = gets.chomp
  file_name = file_name + ".txt"
  if (File.file?(file_name) == true)
    write_handler = File.delete(file_name)
    "[!]".magenta + " #{file_name} wurde erfolgreich gelöscht!"
  else
    "[?]".red + " #{file_name} existiert nicht!"
  end
end

def k_anlegen
  puts "[Anlegen eines neuen Kontaktes]".blue

  print "Nachname: "
  nachname = gets.chomp
  print "Vorname: "
  vorname = gets.chomp
  print "Telefonnummer: "
  telefonnummer = gets.chomp

  telefonnummer = gets.chomp
  File.open(file_name, 'r+') { |file| file.write(namename + ';' + vorname + ';') }
end

def k_auswaehlen
end

def k_bearbeiten
end

def k_loeschen
end

def t_speichern
end

def t_verlassen
  false
end

while execute == true
  puts "[---------------------------]".green
  puts "[1]".yellow + " Telefonbuch auswählen"
  puts "[2]".yellow + " Telefonbuch anlegen"
  puts "[3]".yellow + " Telefonbuch löschen"
  puts "[4]".cyan + " Kontakt anlegen"
  puts "[5]".cyan + " Kontakt auswählen"
  puts "[6]".cyan + " Kontakt bearbeiten"
  puts "[7]".cyan + " Kontakt löschen"
  puts "[0]".red + " Telefonbuch verlassen"
  puts "[--------------------------]".green
  print "Auswahl: "
  selection = gets.to_i

  case selection
  when 1 then puts t_auswaehlen
  when 2 then puts t_anlegen
  when 3 then puts t_loeschen
  when 4 then puts k_anlegen
  when 5 then puts k_auswaehlen
  when 6 then puts k_bearbeiten
  when 7 then puts k_loeschen
  when 0 then puts execute = t_verlassen
  else puts "[?]".magenta + " falscher Input"
  end
end
