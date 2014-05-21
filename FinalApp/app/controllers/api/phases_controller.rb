module Api
  class PhasesController < ApiController
    def index
      @phases = Project.find(params[:project_id]).phases
      render json: @phases
    end

    def show
      @phase = Phase.find(params[:id])
      render json: @phase
    end

    def create
      @phase = Phase.new(phase_params)
      if @phase.save
        render json: @phase
      else
        render json: @phase.errors.full_messages
      end
    end

    def update
      @phase = Phase.find(params[:id])

      if @phase.update_attributes(phase_params)
        render json: @phase
      else
        render json: @phase.errors.full_messages
      end
    end

    def destroy
      Phase.find(params[:id]).try(:destroy)
      render json: {}
    end

    private
    def phase_params
      params.require(:phase).permit(:title, :description, :end_date, :project_id)
    end
  end
end
