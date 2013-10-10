class StateInput < SimpleForm::Inputs::CollectionInput
  def input
    #FIXME: depends on approtriate state machine presence
    input_options[:selected] ||= object.state ||
      object.class.state_machine.initial_state(object).name

    @builder.collection_select(
      attribute_name, collection, :value, :human_name,
      input_options, input_html_options
    )
  end

:private
  def collection
    #FIXME: depends on approtriate state machine presence
    object.class.state_machine.states
  end
end
