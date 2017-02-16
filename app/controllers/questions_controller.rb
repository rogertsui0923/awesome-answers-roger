class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # this will execute the method 'find_question' before it executes the action
  # if you give it 'only' or 'except' options then it will only include or only exclude certain actions
  before_action :find_question, only: [:show, :edit, :destroy, :update]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    # by default this will render app/views/questions/new.html.erb
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:notice] = 'Question created successfully'
      redirect_to question_path({ id: @question.id })
    else
      # this will force Rails to render: app/views/questions/new.html.erb
      # instead of the default: app/views/questions/create.html.erb
      flash.now[:alert] = 'Please fix messages below'
      render :new
    end
  end

  def show
    @answer = Answer.new
  end

  def index
    @questions = Question.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Question updated!'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'Question deleted!'
  end

  private
  def question_params
    params.require(:question).permit([:title, :body])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def authorize
    if cannot?(:manage, @question)
      redirect_to root_path, alert: 'Not authorized!'
    end
  end
end
