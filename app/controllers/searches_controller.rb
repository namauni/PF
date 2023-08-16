class SearchesController < ApplicationController
before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Content"
      @contents = Content.looks(params[:search], params[:word])
    else
      @questions = Question.looks(params[:search], params[:word])
    end
    render :search_result
  end
end