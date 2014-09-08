class Administration::CategoriesController < Administration::AdministrationController
  before_filter :set_category, only: [:edit, :update, :destroy]
  before_filter :set_category_type
  before_filter :set_tab, except: :index

  def new
    @category = @category_type.new(buyout_enabled: false)
  end

  def create
    @category = @category_type.new(category_params)
    @category.assign_attributes({
      customer_ids: category_params[:customer_ids],
      agent_ids: category_params[:agent_ids]
    })

    if @category.save
      @category.move_leads_to_subcategory
      redirect_to correct_path, notice: t('flash.categories.create.notice')
    else
      render :new
    end
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to correct_path, notice: t('flash.categories.update.notice')
    else
      render :edit
    end
  end

  def destroy
    notice = @category.destroy ? :notice : :error
    redirect_to categories_path, notice: t(notice, scope: 'flash.categories.destroy')
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def set_category_type
    @category_type =
      if @category
        @category.class.to_s
      else
        params[:category_type] || 'LeadCategory'
      end

    @category_type = @category_type.constantize
  end

  def set_tab
    self.class.set_tab(@category_type == LeadCategory ? 'browse_leads' : 'browse_deals')
  end

  def correct_path
    @category_type == LeadCategory ? categories_path : deal_categories_path
  end

  def category_params
    params[@category_type.to_s.underscore.to_sym] || params[:category]
  end
end
