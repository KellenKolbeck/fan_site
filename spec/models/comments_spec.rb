require 'rails_helper'

describe Comment do
  it { should belong_to :article }
  it { should validate_presence_of :user }
  it { should validate_presence_of :content }
end
