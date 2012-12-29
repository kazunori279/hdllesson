// Osc Web UI

// define serial API function
var onOpen = function(connInfo) {

  // get conn id
  connId = connInfo.connectionId;
  console.log("opened: " + connId);

  // send env command  
  var buf = new ArrayBuffer(6);
  var bufView = new Uint8Array(buf);
  bufView[0] = 0xff; // header
  bufView[1] = 0x01; // enverope command
  bufView[2] = $("#env_a").attr("value");
  bufView[3] = $("#env_d").attr("value");
  bufView[4] = $("#env_s").attr("value");
  bufView[5] = $("#env_r").attr("value");
  
  // write and close the connection
  chrome.serial.write(connId, buf, function() {
    console.log("written.");
    chrome.serial.flush(connId, function() {
      console.log("flushed.");
      chrome.serial.close(connId, function() {
        console.log("closed.");
      });
    });
  });
}

// update ADSR values
function updateAdsr() {
  chrome.serial.open("/dev/cu.usbserial-FTG3ZBV4", {bitrate: 921600}, onOpen);
}

// init knobs
$(".dial").knob({
	"change" : function(val) {
		updateAdsr();
	}
});

// init ADSR
updateAdsr();

