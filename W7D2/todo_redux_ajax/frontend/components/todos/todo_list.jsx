import React from 'react';
import TodoForm from '../todo_list/todo_form';

const TodoList = ({ todos, receiveTodo }) => (
  <div>
    <ul>
      {todos.map((todo) => <li key={todo.id}>{todo.title}</li>)}
    </ul>
    <TodoForm receiveTodo={receiveTodo}/>
  </div>
);

export default TodoList;
