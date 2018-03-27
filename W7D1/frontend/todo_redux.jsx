import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from '../store/store';
import { receiveTodos, receiveTodo } from '../actions/todo_actions';
import Root from './components/root';
import allTodos from '../reducers/selectors';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  window.allTodos = allTodos;
  ReactDOM.render(<Root store={store} />, root);
});

//
// const newTodos = [
//   { id: 3, title: 'watch tv', body: 'with chips', done: false },
//   { id: 4, title: 'play Overwatch', body: 'with laptop and a drink', done: false },
// ];
