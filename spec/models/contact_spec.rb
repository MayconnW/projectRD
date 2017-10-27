require 'rails_helper'

RSpec.describe Contact, type: :model do
  
  subject {
    described_class.new( email: "test@example.com", cookie: "123testing123id")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a cookie" do
    subject.cookie = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid with an existing email" do
    Contact.create(email: "test@example.com", cookie: "123")    
    expect(subject).to_not be_valid
  end
  
  it "is not valid with an existing cookie" do
    Contact.create(email: "test2@example.com", cookie: "123testing123id")    
    expect(subject).to_not be_valid
  end
  
end
