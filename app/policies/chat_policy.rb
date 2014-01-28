class ChatPolicy
  attr_reader :user, :chat

  def initialize(user, chat)
    @user = user
    @chat = chat
  end

  def index?
    true
    # false
  end

  def show?
    true
    # scope.where(:id => chat.id).exists?
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def edit?
    user_chat?
  end

  def destroy?
    user_chat?
  end

  def scope
    Pundit.policy_scope!(@user, @chat.class)
  end

  def user_chat?
    @user.chats.where(:id => @chat.id).exists?
  end
end

