class PostsController < ApplicationController

  def index
    @posts = PostReport.all
  end


  def new
    @form = CreatePostForm.new()
    respond_with(@form)
  end


  def create
    @form = CreatePostForm.new(params[:create_post_form])

    if @form.valid?
      author = User.find_or_create_by(email: @form.author_email)
      Post.create(author: author,
                  title: @form.title,
                  body: @form.body)
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    post = PostReport.find(params[:id])
    @form = UpdatePostForm.new(post.attributes)
  end

  def update
    @form = UpdatePostForm.new(params[:update_post_form])
    @form.id = params[:id]

    if @form.valid?
      post = Post.find(@form.id)
      post.update(title: @form.title,
                  body: @form.body)
      redirect_to posts_path
    else
      render :edit
    end

  end
end
