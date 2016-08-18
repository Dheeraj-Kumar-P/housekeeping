# Authorization
class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :read, :update, to: :ru
    if user.role_id == Role.admin
      can :manage, Hotel
      can :manage, User
      can :manage, Image
      can :create, Room
      can :create, Salary
      can :read, Role
      cannot :destroy, Role
    elsif user.role_id == Role.staff
      can :manage, Image
      can :manage, TaskAssignment
      can :ru, User
      can :read, Room
      can :read, Shift
      can :read, Task
      cannot :destroy, Role
    elsif user.role_id == Role.maid
      can :manage, Image
      can :manage, TaskAssignment
      can :ru, User
      can :ru, Room
      can :ru, Salary
      can :read, Role
      cannot :read, Shift
      cannot :destroy, Role
    end
  end
end
