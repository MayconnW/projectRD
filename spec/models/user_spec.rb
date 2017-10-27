require 'rails_helper'

RSpec.describe User, type: :model do
  
  Role.create(description: "admin")   
  
  subject {
    described_class.new( email: "test@example.com", name: "teste", role: Role.find_by_description('admin'),
                         password: '123456', password_confirmation:'123456')
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid with an existing email" do
    User.create(email: "test@example.com", name: "teste", role: Role.find_by_description('admin'),
                password: '123456', password_confirmation:'123456')    
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end
  
  it "is possible to change the role" do
    subject.role = Role.find_by_description('admin')
    subject.save!
    expect(subject.role).to eq(Role.find_by_description('admin'))
  end
  
  it "is not valid if password doesn't match with password_confirmation" do
    subject.password = '1234567'
    expect(subject).to_not be_valid
  end
  
  it "is not valid if password doesn't match with password_confirmation" do
    subject.password_confirmation = '1234567'
    expect(subject).to_not be_valid
  end
  
  it "is not valid if password has less than 6 characteres" do
    subject.password = '12345'
    subject.password_confirmation = '12345'
    expect(subject).to_not be_valid
  end
  
end
