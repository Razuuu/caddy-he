Caddy DNS Module - Hurricane Electric
===================================

## DNS Record
1. Create a TXT record named _acme-challenge, click on "Enable entry for dynamic dns" and hit *Submit*.
2. Search for that DNS record and click on that reload button.
3. Click on *Generate a key* and copy that "API-KEY"
4. Paste that button to .env -> HE_API_KEY=<YOUR_API_KEY>

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
