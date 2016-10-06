class EntriesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new
   end

   def create
    @entry = Entry.new
    @entry.content = entry_params[:content]
     @entry.user = User.find(entry_params[:user_id])
     @entry.name = current_user.first_name
     @entry.save
     redirect_to "/"
   end
   def search
     @student = params[:student]
     entries = Entry.where(user_id: params[:student])
     random_entry = entries.sample
     render json: random_entry

   end
   def show

   end

   private

   def entry_params
    params.require(:entry).permit(:content, :user_id)
   end

end
