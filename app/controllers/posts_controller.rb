class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[show edit update destroy]
  POSTS_PER_PAGE = 3

  # GET /posts or /posts.json
  def index
    @page = params.fetch(:page, 0).to_i
    @max = ((Post.all.count - 1) / POSTS_PER_PAGE.to_f).floor
    redirect_to '/404' if @page.negative? or @page > @max

    @posts = Post.all.order('created_at DESC').offset(@page * POSTS_PER_PAGE).limit(POSTS_PER_PAGE)
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    redirect_to new_user_session_path unless user_signed_in?
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
