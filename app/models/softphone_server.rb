class SoftphoneServer < ActiveRecord::Base

  validates_presence_of :name, :server_host, :server_port, :sip_domain, :sip_port

  def to_s
    name
  end
end
