class Ability
  include CanCan::Ability

  def initialize(current_user)
    current_user ||= User.new # guest user (not logged in )
    can :read, User, id:current_user.id
    # can :read, User.where(id: current_user.id)
    # 
    if current_user.admin?
        can :read, :all
    end
    #

  end
end
