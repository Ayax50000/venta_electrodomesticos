require_relative 'Data.rb'

class User

  def initialize(name,password)
    @name = name.upcase
    @password = password.upcase
  end

  def session_open
    continue = false
    $users.each do |user|
      if user[0] == @name and user[1] == @password
       continue = true
       $current_user = user
      end
    end
    continue
  end

  def session_close
    sistem 'exit'
  end

end
