module UserHelper
  def user_by_id(id)
    User.find(id) 
  end
end
