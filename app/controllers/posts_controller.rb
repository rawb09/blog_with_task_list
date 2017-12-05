class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html, :js
  # Index action to render all posts
  def index
@posts = Post.all
  end

  # New action for creating post
  def new
    @post = current_user.posts.build
  end

    # Create action saves the post into database
    def create
      @post = current_user.posts.build(post_params)
      if @post.save(post_params)
        flash[:notice] = "Successfully created post!"
        respond_to do |format|
        format.html { redirect_to posts_path }
      end
      else
        flash[:alert] = "Error creating new post!"
        render :new
      end
    end

  # Edit action retrives the post and renders the edit page
  def edit
  end

  # Update action updates the post with the new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
      respond_to do |format|
      format.html { redirect_to posts_path }
    end
    else
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show

  end

  # The destroy action removes the post permanently from the database
  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "Successfully deleted post!"
      respond_to do |format|
        format.html { redirect_to posts_url }
        # format.js { render :layout => false }
      end


  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
