#Obfsproxy 

This container wraps obfsproxy. Obfsproxy is a transport proxy to obsfucate the nature of network traffic.

## Usage

### Server

`docker run -p 8080:8080 -e OBFSPROXY_ROLE=server robertnorthard/obfsproxy`

### Client

`docker run -p 8080:8080 -e OBFSPROXY_ROLE=client robertnorthard/obfsproxy`

## Environment Variables

* OBFSPROXY_ROLE - client or server.
* LOG_MIN_SEVERITY - obfsproxy log severity.
* DESTINATION_ADDRESS - address to route to.
* DESTINATION_PORT - destination port to route to.
* LISTEN_ADDRESS - listen address (e.g. 0.0.0.0)
* LISTEN_PORT - listen port (e.g. 8080)

## Testing

Tests are orchestrated using rake.

To execute tests execute;

`rake`
