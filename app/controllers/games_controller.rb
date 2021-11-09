require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    # display a new random grid and a form.
    # The form will be submitted (with POST) to the score action.
    @letters = ("a".."z").to_a.shuffle[0...10]
  end

  def score
    @word = params[:word]

    @response = if english_word?(@word)
    URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
    end
  end
end
