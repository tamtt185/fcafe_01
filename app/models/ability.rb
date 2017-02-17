class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    
    case user.role.to_sym
    when :admin
      can :manage, :all
      cannot :edit, User do |user_account|
        user_account != user
      end
    when :mod
      can :manage, :all
      cannot :update, User
      cannot :destroy, User do |account|
        account.mod?
      end
    when :shop_owner
      can :manage, Product
    when :staff
      can :manage, Product
    else
      can :read, :all
      can :create, Suggestion
      can :destroy, Suggestion do |suggestion|
        suggestion.status.to_sym == :processing
      end
      can :edit, User do |user_account|
        user_account == user
      end
    end
  end
end
