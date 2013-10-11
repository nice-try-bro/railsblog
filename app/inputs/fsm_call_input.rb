class FsmCallInput < SimpleForm::Inputs::CollectionInput
  def input
    #FIXME: depends on appropriate state machine presence
    input_options[:include_blank] ||= object.human_state_name

    @builder.collection_select(
      attribute_name, collection, :event, :human_to_name,
      input_options, input_html_options
    )
  end

:private
  def collection
    #FIXME: depends on appropriate state machine presence
    object.state_transitions
  end
end
