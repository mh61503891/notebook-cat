module NotebookCat

  class Memo

    def self.read(path)
      new(File.read(path))
    end

    def initialize(file)
      @file = file
    end

    def count
      @count ||= @file.split(//).size
    end

  end
end
