require 'rails_helper'

RSpec.describe User, type: :model do
  it "名がない場合無効" do
	    user = User.new(
	  	  name: 'hoge',
	  	  email: 'aaa@bbb',
	  	  password: 'pppppppp',
	  	  )
	      expect(user).to be_valid
  end
end