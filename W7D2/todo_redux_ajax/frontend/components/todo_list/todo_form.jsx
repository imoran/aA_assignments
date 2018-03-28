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

  handleSubmit(e) {
    e.preventDefault();

    const newTodo = Object.assign({}, this.state);
    newTodo.id = new Date().getTime();
    this.props.receiveTodo(newTodo);

    this.setState({
      title: '',
      body: '',
    });
  }

  handleTitleChange(e) {
    e.preventDefault();
    this.setState({ title: e.target.value });
  }

  handleBodyChange(e) {
    e.preventDefault();
    this.setState({ body: e.target.value });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <label htmlFor='title'>Title</label>
        <br/>
        <input
          id='title'
          value={this.state.title}
          onChange={this.handleTitleChange.bind(this)}>
        </input>
        <br/>
        <label htmlFor='body'>Body</label>
        <br/>
        <input
          id='body'
          value={this.state.body}
          onChange={this.handleBodyChange.bind(this)}>
        </input>
        <br/>
        <button>Create Todo</button>
      </form>
    );
  }
}

export default TodoForm;
