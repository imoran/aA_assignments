import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false
    };
  }

  render() {
    return (
      <form>
        <label htmlFor='title'>Title</label>
        <br/>
        <input id='title'></input>
        <br/>
        <label htmlFor='body'>Body</label>
        <br/>
        <input id='body'></input>
      </form>
    );
  }
}

export default TodoForm;
