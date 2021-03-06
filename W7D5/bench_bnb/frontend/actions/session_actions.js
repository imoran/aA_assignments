export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

export const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
});

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});

export const logoutCurrentUser = errors => ({
  type: LOGOUT_CURRENT_USER
});

export const login = formUser => dispatch => login(formUser)
  .then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => logout()
  .then( () => dispatch(logoutCurrentUser()));
