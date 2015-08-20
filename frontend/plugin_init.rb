my_routes = [File.join(File.dirname(__FILE__), "routes.rb")]
ArchivesSpace::Application.config.paths['config/routes'].concat(my_routes)

ActionView::PartialRenderer.class_eval do
  alias_method :render_pre_accessions_snapshot, :render
  def render(context, options, block)
    result = render_pre_accessions_snapshot(context, options, block);

    # Add our cart-specific templates to shared/templates
    if options[:partial] == "accessions/toolbar"
      result += render(context, options.merge(:partial => "accessions/snapshot"), nil)
    end

    result
  end
end