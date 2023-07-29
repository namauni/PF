module UsersHelper
def display_follow_bottun?(current_user,target_user)
    return false if current_user.guest_user?
    return false if current_user == target_user
    
    true
end
end