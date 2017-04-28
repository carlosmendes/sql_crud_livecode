require_relative "task"

class Controller
  def initialize(view)
    @view = view
  end

  def add_task
    # ask the user for the task title
    user_task_title = @view.ask_user_for_task_title

    # create new task object
    new_task = Task.new(title: user_task_title)

    # send it to DB
    new_task.save
  end

  def list_tasks
    # get all tasks
    tasks_array = Task.all
    # print tasks
    @view.print_tasks(tasks_array)
  end

  def mark_task_as_complete
    # ask the user what task id to update
    task_id = @view.ask_for_task_index
    # get task from DB
    task = Task.find(task_id)
    # mark as complete
    task.mark_as_complete
    task.save

    # send it to DB

  end
end
