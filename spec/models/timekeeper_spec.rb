require 'spec_helper'

describe TimeKeeper do

  before(:each) do
    @attr = {
      :nom => "Utilisateur exemple",
      :password => "motdepass",
      :password_confirmation => "motdepass"
    }
  end

  it "devrait créer une nouvelle instance avec des attributs valides" do
    User.create!(@attr)
  end


  describe "password validations" do

    it "devrait exiger un mot de passe" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "devrait exiger une confirmation du mot de passe qui correspond" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "devrait rejeter les mots de passe (trop) courts" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "devrait rejeter les (trop) longs mots de passe" do
      long = "a" * 24
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
end
end
