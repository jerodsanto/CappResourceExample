require File.dirname(__FILE__) + '/../test_helper'

class ContactsControllerTest < ActionController::TestCase

  context "A guest" do
    setup do
      @contacts = []
      3.times { @contacts << Factory(:contact) }
    end

    context "GET to index" do
      setup do
        get_json :index
      end

      should_respond_with :success
      should_assign_to :contacts
      should_respond_with_content_type "application/json"
    end

    context "GET to show" do
      setup do
        @contact = Factory :contact
        get_json :show, :id => @contact.id
      end

      should_respond_with :success
      should_assign_to :contact
      should_respond_with_content_type "application/json"
    end

    context "POST to create" do
      setup do
        post_json :create, :contact => Factory.attributes_for(:contact)
      end

      should_respond_with :created
      should_assign_to :contact
      should_respond_with_content_type "application/json"
      should_change("number of contacts", :by => 1) { Contact.count }
    end

    context "PUT to update" do
      setup do
        put_json :update, :id => @contacts.first.id, :contact => Factory.attributes_for(:contact)
      end

      should_respond_with :ok
      should_assign_to :contact
      should_respond_with_content_type "application/json"
      should_not_change("number of contacts") { Contact.count }
    end

    context "DELETE to destroy" do
      setup do
        delete_json :destroy, :id => @contacts.first.id
      end

      should_respond_with :ok
      should_respond_with_content_type "application/json"
      should_change("number of contacts", :by => -1) { Contact.count }
    end

  end
end
