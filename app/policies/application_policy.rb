# frozen_string_literal: true

class ApplicationPolicy

  def index?
    raise NotImplementedError, "#index must be explicit implemented"
  end
  def show?
    raise NotImplementedError, "#show must be explicit implemented"
  end

  def new?
    raise NotImplementedError, "#new must be explicit implemented"
  end

  def create?
    raise NotImplementedError, "#create must be explicit implemented"
  end

  def update?
    raise NotImplementedError, "#update must be explicit implemented"
  end

  def destroy?
    raise NotImplementedError, "#destroy must be explicit implemented"
  end
end
