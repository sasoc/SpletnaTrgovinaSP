class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :card, :all
      can :new, :all
      can :create, :all
      can :destroy, Record, :user_id => user.id
      can :edit, Record, :user_id => user.id
      can :update, Record, :user_id => user.id
      can :remove_carditem, Record, :user_id => user.id
    end
  end
end