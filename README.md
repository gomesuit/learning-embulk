- https://www.embulk.org/
- https://www.datacurrent.co.jp/examples/embulk-on-docker20210519/
- https://masaru-tech.hateblo.jp/entry/2020/08/28/145239
- https://www.optimizesmart.com/how-to-access-bigquery-public-data-sets/
- https://techblog.gmo-ap.jp/2020/05/12/weatherbigdata/

Tryed this commands.

```
embulk example ./try1
embulk guess ./try1/seed.yml -o config.yml
embulk preview config.yml
embulk run config.yml
```
