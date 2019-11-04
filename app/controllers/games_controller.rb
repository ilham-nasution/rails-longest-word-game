require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @words = params[:word]
    letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@words}"
    data = open(url).read
    @result = JSON.parse(data)
    answer = @words.upcase.split("")
    grid = letters.split(" ")
    @check = answer.map do |letter|
      grid.include?(letter)
    end
  end
end
