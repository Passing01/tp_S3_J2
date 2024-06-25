#cette fonction prend en parametre un tableau de prix
#et renvoie les indices des meilleures jours d'achat et de revente pour maximiser les benefices
def day_trader(prices)
    #on initialise les variables pour le meilleur jour d'achat, le meilleur jour de revente et le benefice maximale
    best_buy_day = nil
    best_sell_day = nil 
    max_profit = 0
    #on parcourt tous les jours possible d'achat 
    prices.each_with_index do |buy_price, buy_day|
        #pour chaque jour d'achat on parcours tous les jours suivants pour la revente
        prices[buy_day + 1..-1].each_with_index do |sell_price, sell_day_offset|
            #on calcule le benefice potentiel en soustrayant le prix d'achat du prrrrix de vente
            profit = sell_price - sell_buy
            #si le benefice potentiel est superieur au benefice maximale actuel,
            #on met a jour les variables pour le meilleur jour d'achat, le meilleur jour de revente et le benefice maximale
            if profit > max_profit
                best_buy_day = buy_day
                best_sell_day = buy_day + sell_day_offset +1
                max_profit = profit
            end
        end
    end
    #on renvoie les indices des meilleurs jour d'achat et de revente sous forme de tableau
    [best_buy_day, best_sell_day]
end

#on change la fonction definie dans day_trader.rb
require_relative 'day_trader_spec.rb'

#on decrit les tests à effectuer sur la fonction day_trader
describe "#day_trader" do
    #On verifie que la fonction envoie le bon resultat pour un exemple donné
    it "renvoie le bon resultat pour un exemple donné" do
        expect(day_trader([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end
    #On verifie que la fonction renvoie le bon resultat pour un tableau de prix decroissant
    it "renvoie le bon resultat pour un tableau de prix decroissant" do
        expect(day_trader([10, 8, 6, 4, 2])).to eq(nil)
    end
    #On verifie que la fonction envoie le bon resultat pour un tableau de prix constant
    it "renvoie le bon resultat pour un tableau de prix constant" do
        expect(day_trader([5, 5, 5, 5, 5])).to eq(nil)
    end
    #On verifie que la fonction envoie le bon resultattt pour un tableau de prix a un seul element
    it "renvoie le bon resultat pour un tableau de prix avec un seul element" do
        expect(day_trader([7])).to eq([nil])
    end
    #On verifie que la fonccccction renvoie le bon resultat pour un tableau de prix vide
    it "renvoie le bon resultat pour un tableau de prix vide" do
        expect(day_trader([])).to eq(nil)
    end
end