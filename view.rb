class View
  def ask_user_for_task_title
    puts "What do you want to do?"
    print "> "
    return gets.chomp
  end

  def print_tasks(tasks)
    tasks.each do |task|
      x = task.completed == 1 ? "x" : " "
      puts "#{task.id}. [#{x}] #{task.title}"
    end
  end

  def ask_for_task_index
    puts "Which task id?"
    print "> "
    gets.chomp.to_i
  end
end
