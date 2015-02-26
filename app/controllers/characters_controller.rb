class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
  end

  private
  def character 
    @character ||= params.has_key?(:id) ? Character.find(params[:id]) : Character.new
  end

  def character_params
    params.require(:character).permit(:name, :active)
  end
end
