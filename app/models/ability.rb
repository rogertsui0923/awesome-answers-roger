class Ability
  include CanCan::Ability

  # CanCanCan will automatically initialize this calss for you with every request, so you don't have to instantiate the class yourself. CanCanCan expects that you have a method defined called 'current_user' that will return the user object of the currently signed in user or 'nil' if the user is not signed in
  def initialize(user)
    user ||= User.new

    if user.is_admin?
      can :manage, :all
    end
    
    # this defines an ability that declares that the user can 'manage' meaning do any action (edit, update, destroy, read...) on an instance of the Question calss if 'q.user == user'
    can :manage, Question do |q|
      # you should put an expressoin here that returns a boolean. It should return true if the user should be able to do the operation
      q.user == user
    end
  end
end
