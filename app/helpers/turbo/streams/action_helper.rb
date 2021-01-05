module Turbo::Streams::ActionHelper
  # Creates a `turbo-stream` tag according to the passed parameters. Examples:
  #
  #   turbo_stream_action_tag "remove", target: "message_1"
  #   # => <turbo-stream action="remove" target="message_1"></turbo-stream>
  #
  #   turbo_stream_action_tag "replace", target: "message_1", template: %(<div id="message_1">Hello!</div>)
  #   # => <turbo-stream action="replace" target="message_1"><template><div id="message_1">Hello!</div></template></turbo-stream>
  def turbo_stream_action_tag(action, target:, template: nil)
    target   = convert_to_turbo_stream_dom_id(target)
    template = action.to_sym == :remove ? "" : "<template>#{template}</template>"

    %(<turbo-stream action="#{action}" target="#{target}">#{template}</turbo-stream>).html_safe
  end

  private
    def convert_to_turbo_stream_dom_id(element_or_dom_id)
      if element_or_dom_id.respond_to?(:to_key)
        element = element_or_dom_id
        ActionView::RecordIdentifier.dom_id(element)
      else
        dom_id = element_or_dom_id
      end
    end
end
