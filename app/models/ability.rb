# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    can :read, Event
    can :read, Post
    can :read, User

    if !(user == nil)
      if user.admin?
        can :manage, :all
      else
        can :read, Event
        can :manage, User, id: user.id
        can :manage, Post, user_id: user.id
        can :manage, Event, user_id: user.id
        can :create, Post
      end
      if (user.zin)||(user.can_host)
        can :read, User
        can :manage, Option
      end
      if user.can_host
        can :manage, Contract
      end
    end
  end
end
