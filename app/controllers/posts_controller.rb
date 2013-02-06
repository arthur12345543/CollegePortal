class PostsController < ApplicationController
    def show_all
    @theme=Theme.find(params[:id]) 
    @TitleOfPage = @theme.title
    @posts = @theme.post.order("created_at DESC").paginate(:page => params[:page], :per_page => 20 )
  end


def create
   # if current_user && current_user.role && current_user.role.can_delete_news
      @post = Post.new(params[:post])
      @post.user= current_user
      if @post.save
        redirect_to :action => :show_all, :id => @post.theme_id
      else
        render :action => :new
      end
   # else
   #   redirect_to news_index_path
  #  end
  end
end