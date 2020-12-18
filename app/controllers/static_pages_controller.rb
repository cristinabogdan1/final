class StaticPagesController < ApplicationController
  def home

  end

  def help
        # session[:cart] = nil
  end

  def about
    
  end

  def contact
    
   
  end
  
  
  def sendmessage
    
   
  end
  
  
  
  
  
  def alluser
    
  @users= User.all
  
  
  
  end
  
  def myorder
      
   @orderitems = Orderitem.all
   @orderitems = Orderitem.where(order_id: params[:id])   
      
   @user= User.find(current_user.id)
   @orders = @user.orders.all
  end
  
  
  def adminsection
      
     
     if user_signed_in? 
     @orders = Order.all
  else
    redirect_to "/"
  end
      
      
    
    
  end
  
  
  def paid
      
    @orderitems = Orderitem.all
    @orderitems = Orderitem.where(order_id: params[:id]) 
      
    @order = Order.last
    
    @order.update_attribute(:status, 'This Has Been Paid')
    
    
  end
  
  def search
      
     st = "%#{params[:q]}%"
     @items = Item.where("title like ?"&&"category like ?" , st)
     
      
      
      
  end
  
  
   def upgrade
   
     
     @user= User.find_by(id:params[:id])
        @user.update_attribute(:admin, true)
        redirect_to "/alluser"
    end
    
    def downgrade
        @user= User.find_by(id:params[:id])
       @user.update_attribute(:admin, false)
         redirect_to "/"
    end    
    
    
  def  userprofile
      @user=User.find(current_user)   
      
  end
  
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
  
  
  
  
  
  
  
  
  def show 
        
     @user=User.find(current_user)   
        
    end
  
  
  
end
