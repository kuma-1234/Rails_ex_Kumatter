class PostsController < ApplicationController

  def index 
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
      binding.pry
        redirect_to new_post_path, notice:'つぶやきを作成しました！'
      else
        redirect_to new_post_path, notice:'つぶやき失敗です！'
      end
    end
  end
  
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to  posts_path, notice: 'つぶやきを編集しました！'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:'削除しました！'
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
