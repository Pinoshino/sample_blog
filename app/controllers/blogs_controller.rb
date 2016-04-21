class BlogsController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]
    
    
    # 結構使うアクション
    def set_find
        @blog = Blog.find(params[:id])
    end   
    
    
    def index
       
        #render :text => 'Hello, World'
        
        @q = Blog.search(params[:q])
        @blogs = @q.result(distinct: true)
    
    end

    
    def show
        
      @comment = @blog.comments.new
        
    end


    def new
        @blog = Blog.new
        
    end
    
    
    def create
        @blog = Blog.new(blog_params) # ここで引き渡される。ロックする
        if @blog.save
            redirect_to blogs_path # ブログ一覧へ戻る
        else
            render "new" # また新規投稿画面へ
        end
    
    end
    
    
    def edit
        
    end
    
    
    def update
        if @blog.update(blog_params)
            redirect_to blogs_path
        else
            render 'edit'
        end
    end
    
    
    def destroy
        @blog.destroy
        render :json => {:blog => @blog}
    end
    
    
    private
        
        def blog_params
            
            params[:blog].permit(:title, :content )
            
        end
        

end
