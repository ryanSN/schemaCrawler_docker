## Schema Crawler Docker image

https://www.schemacrawler.com

#### How to Use
Assume your postgres db is already in an existing container

clone this repo, from this repos directory update the items below and run.

```bash
docker run -v $(pwd):/output --rm -i -t \
--network=[nameOfYourNetworkIfYouHave ie. project_name_no_conflict] \
--link [project_name]_db_1:db chatters/schemacrawler_docker:14.20.04 \
-server=postgresql \
-host=db \
-user=[youDbUserName] \
-password=[yourDbPassword] \
-schema=public \
-database=[mydbname] \
-infolevel=standard \
-command=list \
-outputformat=png \
-outputfile=/output/[mydbname].png \
-loglevel=CONFIG
```

This will create a png image in output folder where you checked out this repo.

Ff you output just the dot file and not a png, you will want to install graphviz to run the dot file through it.

To create the png from the dot file on mac
```bash
brew install graphviz
```

```bash
dot -Tpng youDbUserName.png.dot -o youDbUserName.png
```
