if defined?(ChefSpec)
  def create_postgres_database(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_database, :create, resource_name
    )
  end

  def drop_postgres_database(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_database, :drop, resource_name
    )
  end

  def create_postgres_extension(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_extension, :create, resource_name
    )
  end

  def drop_postgres_extension(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_extension, :drop, resource_name
    )
  end

  def create_postgres_language(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_language, :create, resource_name
    )
  end

  def drop_postgres_language(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_language, :drop, resource_name
    )
  end

  def create_postgres_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_user, :create, resource_name
    )
  end

  def update_postgres_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_user, :update, resource_name
    )
  end

  def drop_postgres_user(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :postgres_user, :drop, resource_name
    )
  end
end
