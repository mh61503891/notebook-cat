
require 'thor'
require 'notebook-cat/commands'

module NotebookCat

  class CLI <  Thor

    desc :new, 'Create a new notebook'
    def new
      Commands.new.create()
    end

    desc :show, 'Show a notebook'
    def show(id)
      Commands.new.show(id)
    end

    desc :search, 'Search notebooks'
    def search
      Commands.new.search()
    end

    desc :update, 'Update the database of notebooks'
    def update
      Commands.new.update()
    end

    desc :list, 'List notebooks'
    def list
      Commands.new.list()
    end

  end

end
