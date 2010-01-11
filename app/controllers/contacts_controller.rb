class ContactsController < ApplicationController

  def index
    @contacts = Contact.all.sort

    respond_to do |format|
      format.json  { render :json => @contacts }
    end
  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.json  { render :json => @contact }
    end
  end

  def new
    @contact = Contact.new

    respond_to do |format|
      format.json  { render :json => @contact }
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.json  { render :json => @contact, :status => :created, :location => @contact }
      else
        format.json  { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.json  { render :json => @contact, :status => :ok }
      else
        format.json  { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.json  { head :ok }
    end
  end

end
