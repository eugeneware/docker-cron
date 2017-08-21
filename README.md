# Docker Cron

Simple cron service configured through environment variables.

## Usage

NB: `/var/log/cron.log` is tailed to the logs. So you can concatenate any log messages to that file.

Also, you must use the standard cron format. So, you must have tabs separating the different sections (ie. the times, from the user, from the commands). To do this from the terminal you can use `ctrl-v' then `tab` to insert the tab character.

``` bash
$ docker build -t eugeneware/docker-cron .
# put your cron command in the $CRONCMD environment variable
$ docker run --rm -it -e CRONCMD='* * * * *       root    echo "hey" >> /var/log/cron.log 2>&1' eugeneware/docker-cron
Running crontab:
* * * * *	root	echo "hey" >> /var/log/cron.log 2>&1
hey
````

## Docker compose example

You can use it in a docker-compose.yml file like this:

``` yaml
# docker-compose.yml
cron:
    image: eugeneware/docker-cron
    environment:
        CRONCMD: '* * * * * root    echo "testing" >> /var/log/cron.log 2>&1'
```

``` bash
$ docker-compose up
Creating dockercron_cron_1 ...
Creating dockercron_cron_1 ... done
Attaching to dockercron_cron_1
cron_1  | Running crontab:
cron_1  | * * * * * root    echo "testing" >> /var/log/cron.log 2>&1
cron_1  | testing
```
