class PostsController < ApplicationController
    def show_all
    
    @theme=Theme.find(params[:id]) 
    @TitleOfPage = @theme.title
    @posts = @theme.post.order("created_at DESC").paginate(:page => params[:page], :per_page => 20 )
  end


  def create
    
    if current_user && current_user.role && current_user.role.can_post_forum
      @post = Post.new(params[:post])
      @post.user= current_user
      @post.save
    end
    redirect_to :action => :show_all, :id => @post.theme_id
  end
  
  def destroy
    
    @Post = Post.find(params[:id])
    if @Post.user == current_user || (current_user && current_user.role && current_user.role.can_admin_forum)
      @Theme = @Post.theme
      @Post.destroy
    end
    redirect_to :action=>"show_all", :id => @Theme.id
  end

end