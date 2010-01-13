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

  after_destroy :reseed_if_needed

  def <=>(other)
    name <=> other.name
  end

  private

  def reseed_if_needed
    if Contact.count <= 20
      system "rake db:seed &"
    end
  end

end
