import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};


const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_TODOS:
      let newObject = {};
      action.todos.forEach((todo) => { newObject[todo.id] = todo; });
      merge(newState, newObject);
      return newState;
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;
    default:
      return state;
  }
};

export default todosReducer;

// {
//   type: "RECEIVE_TODOS",
//   todos: {
//     3: {id: 3, title: "...", ...},
//     5: {id: 5, title: "..."}
//   }
// }


// {
//   type: "RECEIVE_TODOS",
//   todos: [
//     {id: 3, title: "...", ...},
//     {id: 5, title: "..."}
//   ]
// }
