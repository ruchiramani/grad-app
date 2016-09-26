class EntriesController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def new
    @entry = Entry.new
   end

   def create
     binding.pry
     @entry = Entry.create(entry_params)
     @entry.user = User.find(params[user])
     redirect_to "/"
   end

   def show
     random_entry = Entry.all.sample
     render json: random_entry
   end

   private

   def entry_params
    params.require(:entry).permit(:name, :content)
   end

end
