# config/initializers/system_metrics_authorization.rb
module SystemMetricsAuthorization
  def self.included(base)
    base.send(:before_filter, :authorize)
  end

  def authorize
    redirect_to root_path unless current_user and current_user.has_one_of_roles? :admin
  end
end

SystemMetrics::MetricsController.send(:include, ::SystemMetricsAuthorization)