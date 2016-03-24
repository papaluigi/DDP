## French citizens living abroad

The initial [set of data](https://www.data.gouv.fr/fr/datasets/francais-de-l-etranger-inscriptions-au-registre-des-francais-etablis-hors-de-france-2001-2013/) shows the state year by year and country by country, of the enrollment in the register of French citizens living outside France , from 2001 to 2013.

The entry in the Register is based on volunteering, and is performed with the network of French embassies and consulates.
Thus, the total number of French citizens living abroad may differ as it also includes the French citizens who are not on the register.

Dataset is provided by the [Open Platform for French Public Data](https://www.data.gouv.fr).

Dataset is merged with [Countries ISO 3166 dataset](http://sql.sh/514-liste-pays-csv-xml) and with [ISO 3166 Country Codes with Associated Continent dataset](https://dev.maxmind.com/geoip/legacy/codes/country_continent/) to enable a complete geographical analysis.

At first, we'll go through a [slidify interactive presentation](http://papaluigi.github.io/FRCITABR/index.html) for a basic dataset study and also to show the power of rCharts.

In a second step, we'll perform a deeper analysis, which would enable us to navigate through timelines, continents and population size.

For that purpose, we have designed and realized a dedicated [shiny application](https://papaluigi.shinyapps.io/FR_CIT_ABROAD/).
