Caddy DNS Module - Hurricane Electric
===================================

Example `compose.yml` file:

```bash
services:
  caddy:
    build: https://github.com/Razuuu/caddy-he.git
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    volumes:
      - ./conf:/etc/caddy
      - ./site:/srv
      - caddy_data:/data
      - caddy_config:/config

volumes:
  caddy_data:
  caddy_config:
```

Example `Caddyfile` files (from [here](https://github.com/caddy-dns/he/blob/main/README.md)):

```json
{
	"module": "acme",
	"challenges": {
		"dns": {
			"provider": {
				"name": "he",
				"api_key": "API_KEY"
			}
		}
	}
}
```

or with the Caddyfile:

```
# globally
{
	acme_dns he API_KEY
}
```

```
# one site
tls {
	dns he {
            api_key API_KEY
        }
}
```
