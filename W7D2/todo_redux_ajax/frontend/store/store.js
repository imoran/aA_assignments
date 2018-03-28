import { createStore } from 'redux';
import { applyMiddleware } from 'redux';
import thunk from '../middleware/thunk';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => createStore(rootReducer, { todos: {} }, applyMiddleware(thunk));

export default configureStore;
