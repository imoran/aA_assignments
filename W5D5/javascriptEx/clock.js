class Clock {

  constructor() {
    // 1. Create a Date object.

    let d = new Date();

    // 2. Store the hours, minutes, and seconds.

    this.hours = d.getHours();
    this.minutes = d.getMinutes();
    this.seconds = d.getSeconds();

    // 3. Call printTime.

    this.printTime();

    // 4. Schedule the tick at 1 second intervals.
    const boundTick = this._tick.bind(this);
    setInterval(boundTick, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS

    return (`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    // 1. Increment the time by one second.

    this.seconds++;

    // 2. Call printTime.

    console.log(this.printTime());
  }
}

const clock = new Clock();
