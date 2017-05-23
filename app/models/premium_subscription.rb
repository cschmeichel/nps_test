class PremiumSubscription < ApplicationRecord
  belongs_to :user

  enum shirt_size: [:S, :M, :L, :XL, :XXL]
  enum subscription_length: [:one_week, :one_month, :one_year]

  def self.query_results(params)
    max_entries = params[:max_entries].to_i if params[:max_entries].present?
    start_date  = DateTime.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i) if
        params[:start_date] && params[:start_date] && params[:start_date][:year].present? && params[:start_date][:month].present? && params[:start_date][:day].present?
    end_date    = DateTime.new(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i) if
        params[:end_date] && params[:end_date] && params[:end_date][:year].present? && params[:end_date][:month].present? && params[:end_date][:day].present?
    end_date ||= start_date # only end date assignment is not allowed

    sorting     = params[:sort_by].present? ? params[:sort_by] : 'created_at'

    query = PremiumSubscription.order("#{sorting} DESC")
    query = query.where('created_at BETWEEN ? AND ?', start_date.beginning_of_day, end_date.end_of_day) if start_date
    query = query.limit(max_entries) if max_entries

    return query
  end

end
