class BlogsController < ApplicationController

    def index
       
       @blogs = Blog.all
        #render :text => 'Hello, World'
        
        @q = Blog.search(params[:q])
        @blogs = @q.result(distinct: true)
    
    end

    
    def show
        @blog = Blog.find(params[:id])
        
    end


    def new
        @blog = Blog.new
        
    end
    
    def create
        @blog = Blog.new(blog_params) # ここで引き渡される。ロックする
        @blog.save
        redirect_to blogs_path # ブログ一覧へ戻る
    end
    
    def edit
        @blog = Blog.find(params[:id])
        
    end
    
    def update
       
       @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path
    end
    
    private
        
        def blog_params
            
            params[:blog].permit(:title, :content, :comment)
            
        end
        

end
