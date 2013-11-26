class UsersController < ApplicationController
layout "master"
respond_to :html, :json
 # GET /users
  # GET /users.json

  def index
  render :layout=>'login'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @tales=@user.tales

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @role = Role.find(:all, :conditions=> "name = 'Guest'")
    @user.role_id = @role.id

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with @user
   
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # GET /users
  # GET /users.json

def assign_role
  @users = User.find(params[:id])
  @roles = Role.find(:all)

   respond_to do |format|
      format.html # assign_role.html.erb
      format.json { render json: @user }
    end

end

 
def assign
  
@user = User.find(params[:id])

if @user.update_attribute :role_id, params[:role]
flash[:notice] = 'User was successfully assigned the role.'
redirect_to :action => 'index'
else 
flash[:notice] = 'Role could not be assigned to the selected user.'
render :action=> 'assign_role'
end
end

def check_login
   User.login(self.user_name, self.encrypted_password)
end


def authenticate
if request.get?
   render :action=> 'index'
else   
@user = User.new(params[:user])
    valid_user = @user.check_login
if valid_user
    session[:user_id] = valid_user.id
    session[:user_id] = valid_user.role.name
    flash[:notice] = "Welcome"+valid_user.user_name
    redirect_to(:controller=>'tales', :action => "index")
else
    flash[:notice] = "invalid user/password"
redirect_to :action=> 'index'
end
end
end
def search_result
user_to_find=params[:user]
user1=user_to_find[:user_name]
@user=User.find(:first, :conditions => ["user_name =?", user1])
@tales=@user.tale
end
end