module GraphsHelper
  def include_graphs_js
    content_for(:head) do
      javascript_include_tag 'graphs', data: { turbolinks_track: true }
    end
  end
end
