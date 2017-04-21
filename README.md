# Description
- forward nginx logs to syslog

# Touchbase
- require NGINX>= 1.7.1
- The GNU C Library provides functions to submit messages to Syslog. They do it by writing to the `/dev/log` socket
- `error_log` level to `warn`, which will log severity levels of `warn, error, crit, alert, and emerg`
- `access_log log_file log_format;`
- `error_log log_file log_level;`

```
debug: Useful debugging information to help determine where the problem lies.
info: Informational messages that aren't necessary to read but may be good to know.
notice: Something normal happened that is worth noting.
warn: Something unexpected happened, however is not a cause for concern.
error: Something was unsuccessful.
crit: There are problems that need to be critically addressed.
alert: Prompt action is required.
emerg: The system is in an unusable state and requires immediate attention.
```
# Usage

- directly to syslog by using the following configs

```
error_log syslog:server=unix:/dev/log,tag=nginx_error error;
access_log syslog:server=unix:/dev/log,facility=local7,tag=nginx_access,severity=info;
```

- `tag`: to make log parsing easier
- `facility`: type of program logging the messag, default is `local7`

# Docker
- run `start_nginx_docker.sh`

# Useful
- https://nginx.org/en/docs/syslog.html 
- `journalctl -u nginx.service --since today`
- List last 10 lines: `journalctl -u nginx.service -n`
- get logs based on severity: `journalctl -p err -b`
- `awk '{print $9}' access.log | sort | uniq -c | sort -rn`
