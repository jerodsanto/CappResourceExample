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

class Contact < ActiveRecord::Base

  def <=>(other)
    name <=> other.name
  end
end
