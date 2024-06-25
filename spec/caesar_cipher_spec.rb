#cette fonction prend chaine de caractère et un decalage en entré
#et renvoie la chaine chiffrée en utilisant le chiffrement de cesar 
def caesar_cipher(string, shift)
    #on convertie la chaine en un tableau de caractères   
    chars = string.chars
    #on parcoure chaque caractère du tableau en utilisant la methode map!
    chars.map! do |char|
        #si le caractère est une lettre(majuscule ou miniscule), on applique
        #le chiffrement de cesar 
        if char =~ /[a-z]/i
            #on convertit le caractère en majuscule et on recupère son code ASCII 
            new_char = char.upcase.ord + shift
            #Si le nouveau code ASCII depasse les 'Z', ou soustrait 26 pour reboucler a 'A'
            new_char = new_char - 26 if new_char > 'Z'.ord
            #Si le nouveau code ASCII est inferieur a 'A', on ajoute 26 pour reboucler à 'Z'
            new_char = new_char + 26 if new_char > 'A'.ord
            new_char.chr.downcase if char =~ /[a-z]/
            new_char.chr if char =~ /[A-Z]/
        else
            #Si le caractère n'est pas une lettre, on le laisse inchangé 
            char
        end
    end
    #on convertit le tableau de caractère chiffré en chaine de caractère
    #et on renvoie le resultat 
    chars.join 
end

# caesar_cipher_spec.rb

require_relative 'caesar_cipher'
#On decrit les tests à effectuer sur la fonction
describe "#caesar_cipher" do
    #On verifie que la fonction chiffre correctement une lettre minuscule avec un decalage de 1
    it "chiffre une lettre minuscule avec un decalage de 1" do
        expect(caesar_cipher("a", 1)).to eq("b")
    end
    #On verifie que la fonction chiffre correctement une lettre majuscule avec un decalage de 1
    it "chiffre une lettre majuscule avec un decalage de 1" do
        expect(caesar_cipher("A", 1)).to eq("B")
    end
    #On verifie que la fonction chiffre correctement une phrase avec un decalage de 5
    it "chiffre une phrase avec un decalage de 5" do
        expect(caesar_cipher("What a string!", 5)).to eq("Bmfy f xywnsl!")
    end
    #On verifie que la fonction reboucle correctement de z à a avec un decalage de 1
    it "reboucle de z à a avec un decalage de 1" do
        expect(caesar_cipher("z", 1)).to eq("a")
    end
    #On verifie que la fonction reboucle correctement de Z à A avec un decalage de 1
    it "reboucle de Z à A avec un decalage de 1" do
        expect(caesar_cipher("A", 1)).to eq("A")
    end
end
