var msg1 = {
  command: 'message',
  identifier: JSON.stringify({
    channel: 'MessageChannel',
  }),
  data:JSON.stringify({
    code: 'NCC1701D',
    action: 'send_message'
  }),
};
socket.send(JSON.stringify(msg1));


let socket = new WebSocket("ws://15.207.98.40:3000/cable/message");
  socket.onopen = function(e) {
    alert("[open] Connection established");
    alert("Sending to server");
  };
  socket.onmessage = function(event) {
    console.log(`[message] Data received from server: ${event.data}`);
  };
  
  socket.onclose = function(event) {
    if (event.wasClean) {
      alert(`[close] Connection closed cleanly, code=${event.code} reason=${event.reason}`);
    } else {
      // e.g. server process killed or network down
      // event.code is usually 1006 in this case
      alert('[close] Connection died');
    }
  };
  
  socket.onerror = function(error) {
    alert(`[error] ${error.message}`);
  };

  const str = JSON.stringify({
    command: 'subscribe',
    identifier: JSON.stringify({
      channel: 'MessageChannel',
    })
  })