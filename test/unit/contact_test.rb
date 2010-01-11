# == Schema Information
#
# Table name: contacts
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < ActiveSupport::TestCase
  should_have_db_column :name
  should_have_db_column :email
  should_have_db_column :phone_number
end
