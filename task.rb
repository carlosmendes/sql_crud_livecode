class Task
  # define the readers
  attr_reader :title, :id, :completed

  def initialize(attributes = {})
    @id = attributes["id"]
    @title = attributes[:title] || attributes["title"]
    @completed = attributes["completed"]
  end

  def self.find(id)
    DB.results_as_hash = true

    # get row from DB
    hash = DB.execute("SELECT *  FROM tasks WHERE id = #{id}")
    # convert row to object and return
    Task.new(hash.first)

  end

  def self.all
    DB.results_as_hash = true
    # get rows from DB
    array_of_hashes = DB.execute("SELECT * FROM tasks")
    # convert rows to objects and return
    array_of_hashes.map do |hash|
      Task.new(hash)
    end
  end

  def save
    # if object is new / id is nill insert and save id else update
    if @id.nil?
      DB.execute("INSERT INTO tasks (title, completed) VALUES ('#{@title}', '#{@completed}')")
      @id = DB.last_insert_row_id
    else
      completed = @completed ? 1 : 0
      DB.execute("UPDATE tasks SET title = '#{@title}', completed = #{completed} WHERE id = #{@id}")
    end
  end

  def mark_as_complete
    # set the task as completed
    @completed = true
  end
end
