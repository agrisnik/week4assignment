# Week  4 assignment in Developing data products course on Coursera

This repository contains Shiny web application that demonstrates a part of real world IoT system - RoBox, where industrial devices are equipped with data driven quality control modules. Each of the modules is built on RPi and runs control software. Thereby there are two main tasks to be done:
* control of quality of service of the industrial devices
* monitoring of the quality control modules themselves

This is achieved through simple monitoring of the CPU load, CPU temperature as well as time of the last updates. Knowing this it is possible to reason about the modules operational status along with the workload since it is directly dependent on industrial device activities. 

The produced data is stored in IBM's Cloudant noSQL database and transferred automatically in every 5 minutes or more often according to the device activities. The web app uses data up to 23rd of July, 2017, which is extracted and stored in CSV file distributed with the application. 

There are two inputs - date range, where the first date has to be smaller the second, and slider inputs, which enables to adjust plot. Everything else is calculated automatically on server side of the app. 

Have fun!
