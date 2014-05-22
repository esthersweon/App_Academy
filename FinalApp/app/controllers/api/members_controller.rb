module Api
class MembersController < ApiController
    def index
      @members = Member.where(:user_id => current_user.id)
      render json: @members
    end

    def show
      @member = Member.find(params[:id])
      render json: @member
    end

    def create
      @member = Member.new(member_params)
      @member.user_id = current_user.id
      if @member.save
        render json: @member
      else
        render json: @member.errors.full_messages
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
      @member = Member.find(params[:id])
      @member.destroy
      render json: {}
    end

    private
    def member_params
      params.require(:member).permit(:fname, :lname)
    end
  
end

end
