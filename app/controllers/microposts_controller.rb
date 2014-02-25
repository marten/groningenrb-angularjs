class MicropostsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    respond_to do |format|
      if @micropost.save
        flash[:success] = "Micropost created!"
        format.html { redirect_to root_url }
        format.json { render json: @micropost, status: :created, location: @micropost }
      else
        format.html { @feed_items = []; render 'static_pages/home' }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_url if @micropost.nil?
    end
end