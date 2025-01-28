# firefly-iii-cron

> Cron container for Firefly III which takes the STATIC_CRON_TOKEN(_FILE) as an env variable.

## Usage

To use the container with Firefly III add the following to the `docker-compose.yml`:

```docker-compose
cron:
    image: ghcr.io/jkrgr0/firefly-iii-cron
    environment:
      CRON_SCHEDULE: "0 3 * * *"
      FIREFLY_III_HOSTNAME: app
      FIREFLY_III_PORT: 80
      STATIC_CRON_TOKEN_FILE: /run/secrets/static_cron_token
    secrets:
      - static_cron_token

secrets:
  static_cron_token:
    file: .static_cron_token
```

## Environment Variables

| Name | Default value | Description |
| ---- | ------------- | ----------- |
| CRON_SCHEDULE | `0 3 * * *` | The schedule when the cron should be executed. |
| FIREFLY_III_HOSTNAME | `app` | The hostname of the Firefly III container. |
| FIREFLY_III_PORT | `80` | The port of Firefly III. |
| USE_HTTPS | `false` | Set to `true` to use HTTPS instead of HTTP. |
| STATIC_CRON_TOKEN | not set | The configured static cron token of **exactly** 32 characters. Use `_FILE` suffix for using docker secrets. |
