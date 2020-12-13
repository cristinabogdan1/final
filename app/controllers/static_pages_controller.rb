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
  
  
  def alluser
    
  @users= User.all
  
  
  
  end
  
  
  def adminsection
    @orders = Order.all
    
  end
  
  
  def paid
    @order = Order.last
    
    @order.update_attribute(:status, 'This Has Been Paid')
    
    
  end
  
  def search
     st = "%#{params[:q]}%"
     @items = Item.where("title like ?", st)
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
  
end
