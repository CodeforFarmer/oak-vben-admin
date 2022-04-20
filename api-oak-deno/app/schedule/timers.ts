const timerId = setTimeout(() => console.log("No!"), 1000);
clearTimeout(timerId);

const intervalId = setInterval(() => console.log("Nope"), 1000);
clearInterval(intervalId);

// cron 