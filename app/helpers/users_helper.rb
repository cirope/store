module UsersHelper
  def user_relations
    @user.relations.new if @user.relations.empty?

    @user.relations
  end
end
