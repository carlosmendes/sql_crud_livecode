# require all files
require_relative "controller"
require_relative "task"
require_relative "view"
require_relative "router"

require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
view = View.new

controller = Controller.new(view)

router = Router.new(controller)
router.run
