class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:new, :edit]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    saved = parse_update_tags(project_params, false)

    respond_to do |format|
      if saved
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    saved = parse_update_tags(project_params, true)

    respond_to do |format|
      if saved
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /projects/[A-Za-z]
  # Group projects by the type given in the URL
  # Display a summary of each project
  def types
    tags = params[:tags].split(',')
    
    @projects = []
    tags.each do |tag|
      Project.joins(:tags).where(tags: {value: "code"}).each do |project|
        @projects << project
      end
    end

    respond_to do |format|
      format.html { render :index }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:url, :picture, :description, :title, :tags)
    end

    def parse_update_tags(parameters, update)
      tags = parameters.delete(:tags)
      tags = tags.split(',')
      saved = false

      if (update)
        saved = @project.update(parameters)
      else
        @project = Project.new(parameters)
        saved = @project.save
      end

      if (saved)
        # Remove old tags
        @project.tags.each do |tag|
          @project.tags.destroy(tag)
        end

        tags.each do |tag|
          @project.tags << Tag.new(value: tag.strip)
        end
      end

      return saved
    end
end
