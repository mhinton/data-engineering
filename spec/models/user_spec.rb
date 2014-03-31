require 'spec_helper'

describe User do
  subject(:user) { build_stubbed(:user) }

  it { should respond_to :email }
  it { should respond_to :password }
  it { should be_valid }
end
