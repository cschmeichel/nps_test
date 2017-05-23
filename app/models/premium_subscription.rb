class PremiumSubscription < ApplicationRecord
  belongs_to :user

  enum shirt_size: [:S, :M, :L, :XL, :XXL]
  enum subscription_length: [:one_week, :one_month, :one_year]

  def self.query_results(params)
    max_entries = params[:max_entries].to_i if params[:max_entries].present?
    query_date  = DateTime.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i) if
        params[:date] && params[:date][:year].present? && params[:date][:month].present? && params[:date][:day].present?
    sorting     = params[:sort_by].present? ? params[:sort_by] : 'created_at'

    query = PremiumSubscription.order("#{sorting} DESC")
    query = query.where('created_at BETWEEN ? AND ?', query_date.beginning_of_day, query_date.end_of_day) if query_date
    query = query.limit(max_entries) if max_entries

    return query
  end

end
