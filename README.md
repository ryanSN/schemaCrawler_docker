## Schema Crawler Docker image

https://www.schemacrawler.com

#### How to Use
Assume your postgres db is already in an existing container

```bash
docker run -v $(pwd):/output --rm -i -t \
--network=nameOfYourNetworkIfYouHave \
--link earnest_db_1:db chatters/schemacrawler_docker:14.20.04 \
-server=postgresql \
-network=earnest_no_staging_conflict \
-host=db \
-user=earnest \
-password= \
-schema=public \
-database=mydbname \
-infolevel=standard \
-command=list \
-outputformat=png \
-outputfile=/output/mydbname.png \
-loglevel=CONFIG
```

To create the png from the dot file on mac
```bash
brew install graphviz
```

```bash
dot -Tpng earnest_db.png.dot -o earnest_db.png
```
