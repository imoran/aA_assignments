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
