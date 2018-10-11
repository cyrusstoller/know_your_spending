class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:welcome]

  def home
    # Logged in
  end

  def welcome
    # New user
    if current_user
      redirect_to action: :home
    end
  end

  # GET /set_catcgories
  def set_categories
    @categories = Category.all
    @current_categories = current_user.categories.all
    # @no_ids = @current_categories.empty?
  end

  # POST /set_categories
  def select_categories
    begin
      @ids = params.require(:categories).permit(ids: [])[:ids].map(&:to_i)
    rescue ActionController::ParameterMissing => e
      @ids = Category.pluck(:id) # all of the ids
    end

    current_user.category_ids = @ids
    CleanUpCategoriesJob.perform_later(current_user.id)

    redirect_to controller: :game, action: :home
  end
end
