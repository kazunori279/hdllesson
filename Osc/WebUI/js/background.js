chrome.app.runtime.onLaunched.addListener(function() {
  chrome.app.window.create('window.html', {
    'width': 600,
    'height': 500,
    type: 'shell'
  });

console.log("HI!");

var onGetPorts = function(ports) {
  for (var i=0; i<ports.length; i++) {
    console.log(ports[i]);
  }
}
chrome.serial.getPorts(onGetPorts);


});