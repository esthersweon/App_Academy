module Api
  class TasksController < ApiController
    def index
      @tasks = Phase.find(params[:phase_id]).tasks
      render json: @tasks
    end

    def show
      @task = Task.find(params[:id])
      render json: @task
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task
      else
        render json: @task.errors.full_messages
      end
    end

    # def update
    #   @task = Task.find(params[:id])

    #   if params[:newUserEmail]
    #     email = params[:newUserEmail]
    #     new_user = User.find_by_email(email)
    #     new_user && !@card.users.include?(new_user) && @card.users << new_user
    #   end

    #   if @card.update_attributes(card_params)
    #     render partial: "api/cards/card", locals: { card: @card }
    #   else
    #     render json: { errors: @card.errors.full_messages }, status: 422
    #   end
    # end

    def destroy
      Task.find(params[:id]).try(:destroy)
      render json: {}
    end

    private
    def task_params
      params.require(:task).permit(:title, :phase_id)
    end
  end
end
