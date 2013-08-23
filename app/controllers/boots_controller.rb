class BootsController < ApplicationController
  def index
    @boots = Boot.all
  end

  def show
    @boot = Boot.find(params[:id])
  end

  def new
    @boot = Boot.new
  end

  def create
    @boot = Boot.new(params[:boot])
    if @boot.save
      redirect_to @boot, :notice => "Successfully created boot."
    else
      render :action => 'new'
    end
  end

  def edit
    @boot = Boot.find(params[:id])
  end

  def update
    @boot = Boot.find(params[:id])
    if @boot.update_attributes(params[:boot])
      redirect_to @boot, :notice  => "Successfully updated boot."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @boot = Boot.find(params[:id])
    @boot.destroy
    redirect_to boots_url, :notice => "Successfully destroyed boot."
  end
end
