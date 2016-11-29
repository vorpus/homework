import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  // let newStore = applyMiddlewares(store, [addLoggingToDispatch]);
  const root = document.getElementById('content');
  // ReactDOM.render(<Root store={newStore} />, root);
  ReactDOM.render(<Root store={store} />, root);
});

// function addLoggingToDispatch (store) {
//   let curDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     curDispatch(action);
//     console.log(store.getState());
//   };
// }


function applyMiddlewares (store, middlewares) {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
}


// export const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   let result = next(action);
//   console.log(store.getState());
//   return result;
// };
