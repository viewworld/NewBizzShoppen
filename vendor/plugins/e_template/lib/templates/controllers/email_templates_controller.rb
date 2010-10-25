class EmailTemplatesController < ApplicationController

  before_filter :get_email_template, :only => [:show, :edit, :update, :destroy, :send_template]

  def index
    @email_templates = EmailTemplate.all
  end

  def show
  end

  def new
    @email_template = EmailTemplate.new
  end

  def create
    @email_template = EmailTemplate.new(params[:email_template])
    if @email_template.save
      redirect_to email_templates_path
    else
      render :action => :new
    end
  end

  def edit
  end
  
  def update
    if @email_template.update_attributes(params[:email_template])
      redirect_to email_templates_path
    else
      render :action => :edit
    end
  end

  def destroy
  end

  def send_template
    @email_template.deliver_to(params[:email], {:user => @user}) if @user = User.find_by_email(params[:email])
    redirect_to email_templates_path
  end

  private

  def get_email_template
    @email_template = EmailTemplate.find(params[:id])
  end

end
