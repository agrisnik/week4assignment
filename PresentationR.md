Week 4 assignment
========================================================
author: Agris Nikitenko
date: 23rd July, 2017
autosize: true

Main features
========================================================

This presentation is devoted to data driven quality control system, which has the follwing main features:

- IoT based solutions that automaticaly acquires data and pushes it into IBM's Cloudant NoSQL database, wher each entry represents JSON document,
- Data is split into quality control data and monitoring data: quality control data represents service specific data while monitoring data represents IoTmodule data
- This Shiny web application is devoted only to IoT monitoring data

Data
========================================================



Data is extracted from Cloudant database and stored in separate CSV for this project convenience. Data is collected anly for one quality control module. Few lines of data are presented here:


```r
head(df[,c(2:ncol(df))])
```

```
         sending_timestamp lokatorsID temp mem CPU_load_15 CPU_load_1
1 2017-07-23T08:15:51.408Z     test-1 43.5 944        0.01       0.05
2 2017-07-23T08:10:51.103Z     test-1 44.0 944        0.01       0.08
3 2017-07-23T08:05:50.836Z     test-1 44.0 944        0.01       0.02
4 2017-07-23T08:00:50.646Z     test-1 44.0 944        0.02       0.13
5 2017-07-23T07:55:50.421Z     test-1 44.0 944        0.01       0.01
6 2017-07-23T07:50:50.190Z     test-1 44.0 944        0.01       0.16
  CPU_load_5                Time
1       0.06 2017-07-23 08:15:00
2       0.05 2017-07-23 08:10:00
3       0.05 2017-07-23 08:05:00
4       0.09 2017-07-23 08:00:00
5       0.05 2017-07-23 07:55:00
6       0.06 2017-07-23 07:50:00
```

Example monitoring data plot
========================================================
Plot presents work load of a single core of the RPi IoT module



```r
plot(g)
```

![plot of chunk unnamed-chunk-4](PresentationR-figure/unnamed-chunk-4-1.png)

Useful links
========================================================

Link to code: [github](http://github.com/agrisnik/week4assignment)

Shiny web app: [WebApp](http://lokatorstestapp.shinyapps.io/week4assignment/)

## Thank you !


