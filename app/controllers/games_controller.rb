class GamesController < ApplicationController

  def home
    
  end

  def new
    alphabet = ('A'..'Z').to_a
    @display_letters = alphabet.sample(10).join
  end

  def score
    require 'open-uri'
    require 'json'
    @input = params[:word]
    @grid = params[:letters]
    check_url = "https://wagon-dictionary.herokuapp.com/"
    check_word = "#{check_url}#{@input}"
    response = open(check_word)
    json = JSON.parse(response.read)

    if @input.chars.all? { |letter| @input.count(letter) <= @grid.count(letter) }

      if json["found"]
         @message = "Valid word"
      else
        @message = "Invalid word"
      end
    else
      @message = "Word not in grid"
    end

  end
end
