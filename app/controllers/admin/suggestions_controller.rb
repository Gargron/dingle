class Admin::SuggestionsController < ApplicationController
  before_filter :is_admin?

  def index
    @suggestions = ProviderSuggestion.waiting.paginate(:page => params[:page])
  end

  def accept
    suggestion = ProviderSuggestion.find(params[:suggestion_id])
    suggestion.accept

    redirect_to admin_suggestions_path, :notice => t('suggestions.accepted')
  end

  private

  def is_admin?
    if current_user.new_record? || !current_user.admin?
      redirect_to admin_login_path and return
    end
  end
end
