import React from 'react';
import ReactDOM from 'react-dom';
// import { fetchAllPokemon } from './actions/pokemon_actions';
import { receiveAllPokemon } from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';

window.fetchAllPokemon = fetchAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;


document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
