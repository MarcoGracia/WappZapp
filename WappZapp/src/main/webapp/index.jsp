<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Autentia - Ejemplo simple con Websockets y Tomcat 7</title>
</head>
<body>
<a href="http://www.autentia.com" target="_blank"></a>
<h1>EJEMPLO SIMPLE DE WEBSOCKETS CON TOMCAT 7</h1>
<script type="text/javascript">

    var ws = null;

    function connect() {
        var URL = 'ws://' + location.host  + '/WappZapp/SimpleWebSocketServlet';
        if ('WebSocket' in window) {
            ws = new WebSocket(URL);
        } else if ('MozWebSocket' in window) {
            ws = new MozWebSocket(URL);
        } else {
            alert('Tu navegador no soporta WebSockets');
            return;
        }
        ws.onopen = function () {
            addMessage('Concectado!');
        };
        ws.onmessage = function (event) {
            var message = event.data;
            alert(event.data);
            addMessage(message);
        };

        ws.onclose = function () {
            addMessage('Desconectado!');
        };

        ws.onerror = function (event) {
            addMessage('Se produjo un error!');
        };
    }

    function disconnect() {
        if (ws != null) {
            ws.close();
            ws = null;
        }
    }

    function sendMessage(message) {
        if (ws != null) {
            ws.send(message);
        }
    }

    function addMessage(message) {
        var messages = document.getElementById('messages').value;
        messages += (message + '\n');
        document.getElementById('messages').value = messages;
    }

</script>

<label for="name">Nombre:</label> <input type="text" id="name"/>
<br/><br/>
<button onclick="connect()">Conectar</button>
<button onclick="disconnect()">Desconectar</button>
<button onclick="sendMessage(document.getElementById('name').value)">Enviar mensaje</button>
<br/><br/>
<textarea rows="5" cols="50" id="messages"></textarea>
<div style='float:left'>
<p>Marco video player</p>
<video width="320" height="240" controls id='video_player'></video></div>

</body>
</html>
