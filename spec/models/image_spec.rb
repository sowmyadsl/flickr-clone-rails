require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to :user }

  it { should validate_presence_of :title }
  it { should validate_presence_of :avatar }

end
