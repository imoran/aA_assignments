import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

export const pokemonReducer = (state = {}, action) => {
  let newState = merge({}, state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
        return action.pokemon;
    default:
      return state;
  }
};
