class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def print_menu
    puts "What do you want to do next?"
    puts "1 - Add a task"
    puts "2 - List tasks"
    puts "3 - Mark as complete"
  end

  def route_action(action)
    case action
    when 1 then @controller.add_task
    when 2 then @controller.list_tasks
    when 3 then @controller.mark_task_as_complete
    else
      puts "Wrong input..."
    end
  end
end
