require 'rails_helper'

RSpec.describe Track, type: :model do
  
  subject {
    described_class.new( cookie: "123", url: "testB")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "has the tracks after it has been tracked" do
    Contact.create(email: "test2@example.com", cookie: "123")
    subject.save!
    expect(subject).to eq(Contact.find_by_email('test2@example.com').tracks.last) 
  end
end
