---
title       : French citizens living abroad
subtitle    : A study of french population living outside France
author      : Louis-Ferdinand Goffin, aka Papaluigi
job         : Junior Data Scientist
framework   : io2012
highlighter : highlight.js
hitheme     : tomorrow
#url:
#    lib: ../../librariesNew #Remove new if using old slidify
#    assets: ../../assets
widgets     : [mathjax, quiz, bootstrap]
ext_widgets : {rCharts: ["libraries/highcharts","libraries/nvd3", "libraries/morris", "libraries/leaflet", "libraries/rickshaw"]}
#mode        : selfcontained # {standalone, draft}
mode        : selfcontained
---




## The Data Source

The initial [set of data](https://www.data.gouv.fr/fr/datasets/francais-de-l-etranger-inscriptions-au-registre-des-francais-etablis-hors-de-france-2001-2013/) shows the state year by year and country by country, of the enrollment in the register of French citizens living outside France , from 2001 to 2013.

The entry in the Register is based on volunteering, and is performed with the network of French embassies and consulates.
Thus, the total number of French citizens living abroad may differ as it also includes the French citizens who are not on the register.

Dataset is provided by the [Open Platform for French Public Data](https://www.data.gouv.fr).


--- .class #id 

## The initial Dataset



Let's apply a basic dataset cleaning and have a look to the data (first lines)

<!-- html table generated in R 3.2.2 by xtable 1.7-4 package -->
<!-- Thu Mar 24 14:46:38 2016 -->
<table border=1>
<tr> <th>  </th> <th> NAME_FR </th> <th> 2001 </th> <th> 2002 </th> <th> 2003 </th> <th> 2004 </th> <th> 2005 </th> <th> 2006 </th> <th> 2007 </th> <th> 2008 </th> <th> 2009 </th> <th> 2010 </th> <th> 2011 </th> <th> 2012 </th> <th> 2013 </th>  </tr>
  <tr> <td align="right"> 1 </td> <td> AFGHANISTAN </td> <td>  </td> <td>  </td> <td>  </td> <td>  </td> <td> 206 </td> <td> 226 </td> <td> 189 </td> <td> 177 </td> <td> 303 </td> <td> 319 </td> <td> 334 </td> <td> 286 </td> <td> 241 </td> </tr>
  <tr> <td align="right"> 2 </td> <td> AFRIQUE DU SUD </td> <td> 5 254 </td> <td> 5 438 </td> <td> 5 958 </td> <td> 6 312 </td> <td> 6 130 </td> <td> 6 560 </td> <td> 6 447 </td> <td> 6 987 </td> <td> 6 998 </td> <td> 7 054 </td> <td> 7 108 </td> <td> 7209 </td> <td> 7283 </td> </tr>
  <tr> <td align="right"> 3 </td> <td> ALBANIE </td> <td> 54 </td> <td> 55 </td> <td> 56 </td> <td> 56 </td> <td> 79 </td> <td> 96 </td> <td> 100 </td> <td> 90 </td> <td> 86 </td> <td> 121 </td> <td> 172 </td> <td> 198 </td> <td> 201 </td> </tr>
  <tr> <td align="right"> 4 </td> <td> ALGERIE </td> <td> 7 389 </td> <td> 12 541 </td> <td> 22 202 </td> <td> 30 964 </td> <td> 38 080 </td> <td> 41 498 </td> <td> 36 782 </td> <td> 34 718 </td> <td> 30 993 </td> <td> 28 287 </td> <td> 28 830 </td> <td> 30344 </td> <td> 31677 </td> </tr>
  <tr> <td align="right"> 5 </td> <td> ALLEMAGNE </td> <td> 87 677 </td> <td> 96 619 </td> <td> 107 774 </td> <td> 106 781 </td> <td> 101 391 </td> <td> 108 821 </td> <td> 99 288 </td> <td> 106 842 </td> <td> 109 468 </td> <td> 111 742 </td> <td> 114 372 </td> <td> 110881 </td> <td> 112238 </td> </tr>
  <tr> <td align="right"> 6 </td> <td> ANDORRE </td> <td> 2 717 </td> <td> 3 159 </td> <td> 3 783 </td> <td> 3 900 </td> <td> 3 991 </td> <td> 4 207 </td> <td> 4 091 </td> <td> 3 885 </td> <td> 3 766 </td> <td> 3 454 </td> <td> 3 288 </td> <td> 3309 </td> <td> 3226 </td> </tr>
   </table>

--- .class #id 

## Priliminary results

Let's merge the data with [Countries ISO 3166 dataset](http://sql.sh/514-liste-pays-csv-xml) and with [ISO 3166 Country Codes with Associated Continent dataset](https://dev.maxmind.com/geoip/legacy/codes/country_continent/) to perform a first graphical study of the ditribution accross continents :








<iframe src="fig/r1.html" width=100%, height=600></iframe>

--- .class #id 

## Let's go further

We now want to perform a deeper analysis, which would enable us to navigate through timelines, continents and population size.

For that purpose, we have designed and realized a dedicated [shiny application](https://papaluigi.shinyapps.io/FR_CIT_ABROAD/).


