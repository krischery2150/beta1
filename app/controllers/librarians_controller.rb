class LibrariansController < ApplicationController
  def new
    @user = Librarian.new
  end

  def index
  end

  def show
    @user = Librarian.find(params[:id])
  end


  def create
    @user = Librarian.new(librarian_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end


private


def librarian_params
  params.require(:librarian).permit(:first_name,:last_name, :email, :password,
                                    :password_confirmation, :profile_pic,
                                    :birth_day, :birth_month, :birth_year, :gender)
end

end
