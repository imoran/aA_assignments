const DOMNodeCollection = require('./dom_node_collection');

function $l(selector) {
  let callbacks = [];
  if (selector instanceof Function) {
    callbacks.push(selector);
  }
  let elements;
  if (selector instanceof HTMLElement) {
    elements = [selector];
  } else {
    elements =  Array.from(document.querySelectorAll(selector));
  }
  if (document.readyState === 'complete') {
    alert('the document is ready!');
    callbacks.forEach(function(callback) {
      callback();
    });
  }
  return new DOMNodeCollection(elements);
}

window.$l = $l;
