class FsmCallInput < SimpleForm::Inputs::CollectionInput
  def input
    #FIXME: depends on appropriate state machine presence
    @builder.collection_select(
      attribute_name, collection, :name, :human_name,
      input_options, input_html_options
    )
  end

:private
  def collection
    #FIXME: depends on appropriate state machine presence
    object.class.state_machine.events
  end
end
