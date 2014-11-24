class ResumesController < ApplicationController
  before_action :set_resume, only: [:edit, :update, :destroy]
  before_action :set_resume_items, only: [:edit, :update, :destroy]
  before_action :admin_only, only: [:index, :new, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    # Find resume based on param title
    @resume = Resume.find_by(title: params[:title])

    if @resume == nil
      flash[:error] = "Could not find resume with title #{params[:title]}"
      redirect_to root_url
      return
    end

    # Filter out eductation resume items
    # Filter out work items
    # Filter out skill items
    @educations = @resume.resume_items.joins(:tags).where("tags.value" => "education")
    @jobs = @resume.resume_items.joins(:tags).where("tags.value" => "work")
    @skills = @resume.resume_items.joins(:tags).where("tags.value" => "skill")
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
    @resume_item = ResumeItem.new
  end

  # GET /resumes/1/edit
  def edit
    @resume_item = ResumeItem.new
  end

  # POST /resumes
  # POST /resumes.json
  def create
    update_tags(tag_vals: get_tags_from_params(params[:resume]), project_id: @project.id)
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to resume_title_path(@resume.title), notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to resume_title_path(@resume.title), notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    def set_resume_items
      @resume_items = Resume.find(params[:id]).resume_items
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:name, :title, :objective)
    end
end
