# Authorization
class Ability
  include CanCan::Ability

  def initialize(user)
    #   user ||= User.new # guest user (not logged in)
    alias_action :read, :update, to: :ru
    if user.role_id == Role.admin
      can :manage, Hotel
      can :manage, User
      can :create, Room
      can :create, Salary
      can :read, Role
    elsif user.role_id == Role.staff
      can :read, TaskAssignment
      can :ru, User
      can :read, Room
      can :read, Shift
      can :read, Task
    elsif user.role_id == Role.maid
      can :manage, TaskAssignment
      can :ru, User
      can :ru, Room
      can :ru, Salary
      can :read, Role
    end
  end
end
