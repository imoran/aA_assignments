import * as APIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';



const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};

const receiveTodo = (todo) =>  {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

function fetchTodos() {
  return function(dispatch) {
    APIUtil.fetchTodos().then(todos => {
      const action = receiveTodos(todos);
      dispatch(action);
    });
  };
}

export { receiveTodos, receiveTodo, fetchTodos };
