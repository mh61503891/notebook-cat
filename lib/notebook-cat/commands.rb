require 'pathname'
require 'fileutils'
require 'notebook-cat/memo'

module NotebookCat
  class Commands

    def create
    end

    def show(id)
      path = Pathname.new('posts').join(id).sub_ext('.md')
      @memo = Memo.read(path)
      # TODO development
      # require 'pry'
      # binding.pry
      require 'awesome_print'
      ap @memo.contents
    end

    def update
    end

    def info
    end

    def list
    end

  end
end



#   desc :new, 'create a new post'
#   def new
#     path = Pathname.new('posts')
#     if !path.exist? && !path.directory?
#       FileUtils.mkdir_p(path)
#     end
#     file = path.join(Time.now.strftime('%Y%m%d%H%M%S')).sub_ext('.md')
#     puts file
#     FileUtils.touch(file)
#
#   end
#
#   desc :update, 'update the database'
#   def update
#     require 'natto'
#     @natto = Natto::MeCab.new
#     @natto.parse(File.read('posts/20170802013954.md')) do |n|
#       features = n.feature.split(',').map(&:strip)
#       if features[0] == '名詞'
#         name = features[6]
#         require 'pry'
#         binding.pry
#
#       end
#       # if n.feature.match(/名詞/)
#       #
#       #   p n
#       # end
#
#       # p a
#     end
#   end
#
#
#
# end
