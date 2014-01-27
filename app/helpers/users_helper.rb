module UsersHelper
  def user_relations
    @user.relations.new if @user.relations.empty?

    @user.relations
  end

  def render_organization_list
    render(
      'shared/unordered_list',
      title: Organization.model_name.human(count: @user.organizations.count),
      collection: @user.organizations
    )
  end
end
