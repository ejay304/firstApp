# ************************************************************************************
# member.rb  
#
# @author Crescenzio Fabio
# @author Fresco Alain
# @author Therisod Romain
# @author Triki Mohamed
# @author Walpen Laurian
# 
# Ce fichier définit le modèle pour les membres et gère le hashage du mot de passe 
#     
# ************************************************************************************
class Member < ActiveRecord::Base
  belongs_to :federation

# Crée automatique l'attribut virtuel 'password_confirmation'.
  validates :password,         :presence     => true,
                               :confirmation => true,
                               :length       => { :within => 4..40 }

  validates :login,          :presence => true,
                                  :length   => { :maximum => 50 }

  before_save :encrypt_password

  def self.authenticate(login, password)
          user = find_by_login(login)
          return nil if user.nil?
          return user if user.password== user.encrypt(password)
  end

  def self.authenticate_with_encrypted_password(login, password)
    user = find_by_login(login)
    return nil if user.nil?
    return user if user.password == password
  end

  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end

  private

    def encrypt_password 
      self.password = encrypt(password)
    end
end
