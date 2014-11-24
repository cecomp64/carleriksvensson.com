class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    # Hide portions of the site from non-admins
    def admin_only
      if !is_admin?
        flash[:error] = "Permission Denied"
        redirect_to root_url
      end
    end

    # Hide all user pages if user is not logged in
    def require_login
      if !logged_in?
        flash[:error] = "Please login first"
        redirect_to root_url
      end
    end

    # Return a list of tag values taken from
    # the input parameters.  Removes the tags
    # from the parameters
    def get_tags_from_params(parameters)
      parameters.delete(:tags).split(',').map{|t| t.strip}
    end

    # Add new tags to a resume_item, project, or post
    # If the tag already exists, don't add it
    def update_tags(hash_params)
      tag_vals = hash_params[:tag_vals]
      resume_item_id = hash_params[:resume_item_id]
      post_id = hash_params[:post_id]
      project_id = hash_params[:project_id]

      tag_vals.each do |tag|
        # Find existing tag
        t = Tag.find_by(value: tag, resume_item_id: resume_item_id, project_id: project_id, post_id: post_id)

        # Add the tag if it doesn't already exist
        if (t == nil)
          Tag.create(value: tag, resume_item_id: resume_item_id, project_id: project_id, post_id: post_id)
        end
      end

      # Find tags to be removed
      etags = Tag.all.where(resume_item_id: resume_item_id, project_id: project_id, 
                            post_id: post_id).map{|tag| tag.value}
      etags.each do |tag|
        # Delete any tags that aren't in the list
        if (!tag_vals.include?(tag))
          t = Tag.find_by(value: tag, resume_item_id: resume_item_id, project_id: project_id, post_id: post_id)

          # By construction, this should exist..
          if (t != nil)
            t.destroy
          else 
            flash[:error] = "Could not delete tag: #{tag}"
          end

        end
      end # etags
    end

    # Get tags from parameters and update based on IDs
    def get_and_update_tags(parameters, resume_item_id=nil, project_id=nil, post_id=nil)
      update_tags(get_tags_from_params(parameters), resume_item_id, project_id, post_id)
    end
end
