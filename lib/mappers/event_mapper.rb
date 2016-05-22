class EventMapper < ContentfulMiddleman::Mapper::Base
  def map(context, entry)
    super
    context.asSlug = [entry.title, entry.fields[:startingAt].strftime('%Y-%m-%d')].join(' ').parameterize
  end
end
