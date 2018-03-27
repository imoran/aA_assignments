import React from 'react';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component {
    render() {
      let { todos, receiveTodo } = this.props;
      return (
        <div>
          <ul>
            {todos.map((todo) => <li key={todo.id}>{todo.title}</li>)}
          </ul>
          <TodoForm />
        </div>
      );
    }
}

export default TodoList;
