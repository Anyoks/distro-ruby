# == Schema Information
#
# Table name: public.organizations
#
#  id         :uuid             not null, primary key
#  name       :string
#  subdomain  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ApplicationRecord
    after_create  :create_tenant

    
    private 
        def create_tenant
            Apartment::Tenant.create(subdomain)
        end
end
