class PagesController < ApplicationController
#def todopage
#@heading = 'todos page'
#@text = 'page of todo'
#end

def todopage
  @todo = Todo.all
end
end
