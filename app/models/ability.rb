class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Post, public: true
    can :read, Comment, public: true

    return unless current_user.present?
    can :read, :all
    can [:create, :read, :update, :destroy], Post, author: current_user
    can [:create, :read, :update, :destroy], Comment, author: current_user

    return unless current_user.role == 'admin' # additional permissions for administrators

    can [:create, :read, :update, :destroy], :all
  end
end
