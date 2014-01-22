<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>WappZapp Video Player</title>
</head>
<script type="text/javascript">

    var ws = null;
    var myVideo = null;

    function connect() {
    	
        var URL = 'ws://' + location.host  + '/WappZapp/VideoSocket';
        
        if ('WebSocket' in window) {
            ws = new WebSocket(URL);
        } else if ('MozWebSocket' in window) {
            ws = new MozWebSocket(URL);
        } else {
            alert('Tu navegador no soporta WebSockets');
            return;
        }
        ws.onopen = function () {
        	myVideo = document.getElementById('video');
            myVideo.play();
            enableButtons(true);
        };
        
        ws.onmessage = function (event) {
            var message = event.data;
			if(message == "0"){
				myVideo.pause();
				enableButtons(false);
			}	
			else{
				myVideo.play();
				enableButtons(true);
			}

        };

        ws.onerror = function (event) {
           disconnect();
           connect();
        };
    }

    function disconnect() {
        if (ws != null) {
            ws.close();
            ws = null;
        }
    }

    function sendOrder(message) {
        if (ws != null) {
            ws.send(message);
        }
    }
    
    function enableButtons(trigger){
    	document.getElementById("play").disabled = trigger;
    	document.getElementById("pause").disabled = !trigger; 
    }

</script>
<body onload="connect();">
<a href="http://www.autentia.com" target="_blank"></a>
<h1>WappZapp Video player</h1>
<video width="320" height="240" id ="video">
   <source src="wappZapp.mp4" type="video/mp4">
 </video>
<br/><br/>
<button onclick="sendOrder('1')" id="play">Play</button>
<button onclick="sendOrder('0')" id="pause">Pause</button>

</body>
</html>
