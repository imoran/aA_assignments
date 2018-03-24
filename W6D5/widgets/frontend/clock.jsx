import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = { date: "", time: "" };
    this.tick = this.tick.bind(this);
  }

  render() {
    return (
      <div className="outside">
        <div className="h1-left">
          <h1>Clock</h1>
        </div>
        <section className="clock">
          <div>
            <p>Time:</p>
            <p>{this.state.time}</p>
          </div>
          <div>
            <p>Date:</p>
            <p>{this.state.date}</p>
          </div>
        </section>
      </div>
    );
  }

  tick() {
    this.setState({ date: new Date().toLocaleDateString(),
      time: new Date().toLocaleTimeString()});
  }

  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalID);
  }
}

export default Clock;
