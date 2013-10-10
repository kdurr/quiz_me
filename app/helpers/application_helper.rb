module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    # creates a new instance of QuestionChoice
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  # Potentially removing partial dependence
  # def link_to_add_answers(f)
  #   new_answer = QuestionChoice.new
  #   id = new_answer.id
  #   fields = f.fields_for(:question_choice, new_answer, child_index: id) do |b|
  #     b.input :option, label: 'Answer Option'
  #     b.input :correct, label: false, :inline_label => true
  #   end
  #   link_to('Add Answer', '#', class: 'add_fields', data: {id: id, fields: fields.gsub('\n', '')})
  # end
end
