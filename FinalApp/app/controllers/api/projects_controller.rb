module Api
  class ProjectsController < ApiController
    def index
      @projects = Project.all
      render json: @projects
    end

    def show
      @project = Project.find(params[:id])
      render json: @project
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        render json: @project
      else
        render json: @project.errors.full_messages
      end
    end

  #   def update
  #     @project = current_user.projects.find(params[:id])

  #     if params[:newMemberEmail]
  #       email = params[:newMemberEmail]
  #       new_member = User.find_by_email(email)
  #       new_member && !@board.members.include?(new_member) && @board.members << new_member
  #     end

  #     if @project.update_attributes(project_params)
  #       render partial: "api/projects/project", locals: { project: @project }
  #     else
  #       render json: { errors: @project.errors.full_messages }, status: 422
  #     end
  #   end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      render json: {}
    end

    private
    def project_params
      params.require(:project).permit(:title, :course, :description)
    end
  end
end
