class Admin::QuestionsCommentsController < ApplicationController
def index
  @questions_comments = QuestionsComment.all.order(created_at: :desc)
end  

def destroy
    QuestionsComment.find(params[:id]).destroy
    redirect_to question_path(questions_comment.id)
end
end