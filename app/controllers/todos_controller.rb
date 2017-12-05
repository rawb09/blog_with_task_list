class TodosController < WelcomeController
  before_action :find_todo, only: [:edit, :update, :show, :delete]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @todos = Todo.all
  end
    def show
      @todo = Todo.find(params[:id])
    end
      def new
        @todo = current_user.todos.build
      end
      def create
        @todo = current_user.todos.build(todo_params)
        if @todo.save(todo_params)
          flash[:notice] = "Sucessfully created task!"
          redirect_to todos_path
        else
          flash[:alert] = "Error creating new task!"
          render :new
      end
    end
      def edit

      end

      def update
        @todo = Todo.find(params[:id])
        @todo.update todo_params
        redirect_to todos_path
      end
      def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to todos_path
      end
      def complete
        @todo = Todo.find(params[:id])
        @todo.update_attribute(:completed_at, Time.now)
        redirect_to todos_path
      end

      def uncomplete
        @todo = Todo.find(params[:id])
        @todo.update_attribute(:completed_at, nil)
        redirect_to todos_path
      end

      private
    def todo_params
      params.require(:todo).permit(:title, :description)
    end

      def find_todo
        @todo = Todo.find(params[:id])
      end

end
