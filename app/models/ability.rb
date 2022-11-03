# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, Post, public: true
    can :read, Comment, public: true

    return unless current_user.present?
    can :read, Post, author: current_user
    can :destroy, Post, author: current_user

    return unless current_user.present?
    can :read, Comment, author: current_user
    can :destroy, Comment, author: current_user

    return unless current_user.role == 'admin' # additional permissions for administrators

    can :manage, :all
  end
end
