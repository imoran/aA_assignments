/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
    this.eventListeners = {};
  }

  html(content) {
    if (content === undefined) {
      return this.elements[0].innerHTML;
    } else {
      this.elements.forEach(el =>  {
        el.innerHTML = content;
      });
      return this;
    }
  }

  empty() {
    this.html('');
  }

  append(content) {
    if (!content instanceof DOMNodeCollection) {
      this.elements.forEach(el => el.innerHTML.concat(content.outerHTML));
    } else {
      this.elements.forEach(el => {
        let newHTML = el.innerHTML;
        content.elements.forEach(subEl => {
          newHTML += subEl.outerHTML;
        });
        el.innerHTML = newHTML;
      });
    }
  }

  attr(attribute) {
    return this.elements[0].attributes.getNamedItem(attribute).value;
  }

  addClass(newClass) {
    this.elements.forEach((el) => {
      el.className = el.className.concat(` ${newClass}`);
    });
  }

  removeClass(oldClass) {
    this.elements.forEach(el => {
      let classes = el.className.split(' ');
      classes = classes.filter(c => c !== oldClass);
      el.className = classes.join(' ');
    });
  }

  children() {
    //ASK AARON
    let allChildren = [];
    this.elements.forEach(el =>{
      let children = el.children;
      for (let i = 0; i < children.length; i++) {
        allChildren.push(children[i]);
      }
    });
    return new DOMNodeCollection(allChildren);
  }

  parent() {
    let parents = [];
    this.elements.forEach(el => {
    parents.push(el.parentElement);
    });
    parents = parents.filter((el, idx) => parents.indexOf(el) === idx);
    return new DOMNodeCollection(parents);
  }

  find(selector) {
    let results = [];
    this.elements.forEach(el => {
      results.concat(Array.from(el.querySelectorAll(selector)));
    });
    return new DOMNodeCollection(results);
  }

  remove() {
    this.elements.forEach(el => {
      el.innerHTML = '';
    });
    this.elements = [];
  }

  on(action, callback) {
    this.eventListeners[action] = callback;
    this.elements.forEach(el => {
      el.addEventListener(action, callback);
    });
  }
  off(action) {
    this.elements.forEach(el => {
      el.removeEventListener(action, this.eventListeners[action]);
    });
    this.eventListeners[action] = null;
  }
}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);