module TasksHelper
  def render_status_button(task)
    if task.complete?
      link_to 'Uncomplete', update_status_task_path(task), class:  "btn btn-danger", method: :post
    else
      link_to 'Done', update_status_task_path(task), class:  "btn btn-success", method: :post
    end
  end

  def render_title_link(task)
    if task.complete?
      "<s> #{task.title} </s>".html_safe
    else
      task.title
    end
  end

  def render_task_edit_button(task)
    link_to 'Edit', edit_task_url(task), class: "btn btn-primary"
  end

  def render_task_delete_button(task)
    link_to 'Delete', task_path(task), class: "btn btn-danger", method: :delete
  end
end
