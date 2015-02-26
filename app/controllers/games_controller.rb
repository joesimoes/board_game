class GamesController < ApplicationController
  def new
  end

  def create
    @game = Game.new
    characters = params['game']['character_ids'].split(",").reject{|i| i == '' || i == nil}
    characters.each do |id|
      @game.character_games.build(character_id: id)
    end
    @game.save
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @characters = @game.characters.collect(&:name)
    if @characters.empty?
      @audio = 'generic.mp3'
    elsif @characters.count == 6
      @audio = 'everyone.mp3'
    elsif (@characters & ["Percival", "Morgana"]).present?
      @audio = 'percival_morgana.mp3'
    elsif (@characters & ["Oberon", "Mordred"]).present?
      @audio = 'oberon_mordred.mp3'
    elsif @characters.include? "Merlin"
      @audio = 'merlin.mp3'
    end
  end

  private

  def game 
    @game ||= params.has_key?(:id) ? Game.find(params[:id]) : Game.new
  end

  def game_params
    params.require(:game).permit(characters_attributes: [:id, :active])
  end
end
