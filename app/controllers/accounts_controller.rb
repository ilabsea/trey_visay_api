# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :authenticate_admin_user!
  def index
    @accounts = Account.all
  end

  def show
  	@account = Account.find(params[:id])
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    params = convert_role_params
    @account = Account.find(params[:id])
    if(@account.update_attributes!(filter_params))
      redirect_to  accounts_path, notice: 'Account has been updated successfully'
    else
      flash.now[:alert] = 'Failed to update user'
      render :new
    end
  end

  def create
    params = convert_role_params
    @account = Account.new(filter_params)
    @account.password = params[:account][:password]
    @account.password_confirmation = params[:account][:password_confirmation]
    if(@account.valid?)
      if(@account.save!)
        redirect_to  accounts_path, notice: 'Account has been created successfully'
      else
        flash.now[:alert] = 'Failed to save user'
        render :new
      end
    else
      flash.now[:alert] = 'Failed to save user'
      render :new, :errors => @account.errors
    end
  end

  def destroy
    @account = Account.find(params[:id])
    if @account.destroy!
      redirect_to accounts_path(), notice: 'Account has been deleted'
    else
      redirect_to accounts_path(), notice: 'Could not delete account user'
    end
  end

  private
  def filter_params
    params.require(:account).permit(:email, :password, :password_confirmation, :is_admin, :is_counsellor, :schools => [])
  end

  def convert_role_params
    if(params[:account][:role] == Account::ROLE[0])
      params[:account][:is_admin] = true
      params[:account][:schools] = nil
    else
      params[:account][:is_counsellor] = true
      params[:account][:schools] = [params[:account][:schools]]
    end
    params[:account].delete(:role)
    params
  end

end

