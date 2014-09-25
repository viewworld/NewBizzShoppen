class Administration::SharedSoftphonesController < Administration::AdministrationController
  inherit_resources
  defaults :resource_class => Softphone, :instance_name => :softphone
  actions :all, :except => [:show]

  set_tab 'settings'
  set_subtab 'shared_softphones'

  def create
    create! do |success,failure|
      success.html { redirect_to administration_shared_softphones_path }
      failure.html { render :new }
    end
  end

  def update
    update! do |success,failure|
      success.html { redirect_to administration_shared_softphones_path }
      failure.html { render :edit }
    end
  end

  protected

  def collection
    @shared_softphones ||= end_of_association_chain.shared
  end
end
