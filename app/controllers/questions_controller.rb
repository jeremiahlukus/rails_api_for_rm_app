class QuestionsController < ApplicationController

  respond_to :json 

  def index 
    @questions = Question.all 
    @count = Question.all.count

   # response = { :questions => @questions, :count => @count}
    render json: @questions

  end

end
