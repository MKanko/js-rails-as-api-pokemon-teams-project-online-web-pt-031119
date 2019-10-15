class PokemonsController < ApplicationController

    def new
        pokemon = Pokemon.new
    end 

    def create
        tr = Trainer.find_by(id: params[:trainer_id])
        if tr.pokemons.length < 6
            name = Faker::Name.first_name
            species = Faker::Games::Pokemon.name
            pokemon = Pokemon.create(nickname: name, species: species, trainer_id: params[:trainer_id])
            render json: pokemon
        end 
    end 

    def destroy
        pokemon = Pokemon.find(params[:id]).destroy
        render json: pokemon 
    end 

end
