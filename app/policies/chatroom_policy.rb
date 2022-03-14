class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    record.contract.asker.id == user.id || record.contract.receiver.id == user.id
  end
end
