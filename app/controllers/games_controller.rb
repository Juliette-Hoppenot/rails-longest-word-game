require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('a'..'z').to_a.sample }
  end

  def score
    @answer = params[:word].split('')
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    dictionary = open(url).read
    @data = JSON.parse(dictionary)
  end
end
