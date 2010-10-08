class Ability
    include CanCan::Ability
    def initialize(user)
      if user.has_role? :admin
        can :read, User
      end
    end
end