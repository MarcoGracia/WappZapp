package es.mgj.wappzapp.websockets;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class VideoSocket
 */
public class VideoSocket extends WebSocketServlet{
	
	private static final long serialVersionUID = 1L;
    private static final Logger log = LoggerFactory.getLogger(SimpleWebSocketServlet.class);   
    
    /**
     * @see WebSocketServlet#WebSocketServlet()
     */
    public VideoSocket() {super();}
    
    @Override
    protected boolean verifyOrigin(String origin) {
        log.trace("Origin: {}", origin);
        return true;
    }

	@Override
	protected StreamInbound createWebSocketInbound(String arg0,
			HttpServletRequest arg1) {

		return new StreamInboundConnection();
	}
	
	private static class StreamInboundConnection extends StreamInbound {
		 
        @Override
        protected void onOpen(WsOutbound outbound) {
            log.info("Conexi�n abierta");
        }
 
        @Override
        protected void onClose(int status) {
            log.info("Conexi�n cerrada");
        }
 
		@Override
		protected void onBinaryData(InputStream BData) throws IOException {
			
		}

		@Override
		protected void onTextData(Reader TData) throws IOException {
			
			
		}
    }

}
