shinyUI(fluidPage(
	titlePanel(h2("Randomization test: the golden jackals case")),

	sidebarLayout(
	  sidebarPanel(
	  	p("This demo is based on the example of a randomization test, provided by Manly (2007) in his book \"Randomization, Bootstrap and Monte Carlo Methods in Biology\". The table shows mandible lengths in mm for male and female golden jackals, from the collection of the British Museum of Natural History. The test involves random reallocation of the sample lengths, and generation of an empirical distribution of the mean differences under the null hypothesis. The question is wether or not male jackals tend to have bigger mandibles than females"),	
	  	#Slider
	  	sliderInput("n",
                  "Number of randomizations:",
                  min = 20,
                  max = 10000,
                  value = 20),
                  img(src="caureus.png"),
                  p("Canis aureus. Image from http://commons.wikimedia.org/wiki/File:Canis_aureus_-_golden_jackal.jpg")

	  		  	
	  	),  
	  
	  mainPanel(tabsetPanel(type="tabs",
	  	tabPanel("Data",tableOutput('table')),
	  	tabPanel("Empirical distribution",plotOutput("plot")),
	  	tabPanel("Results",tableOutput('results')),
	  	tabPanel("Documentation",helpText("The panel \"Data\" shows measures of mandible lengths of female and male jackals. The goal is to test the hypothesis that male jackals have bigger mandibles than females, through a randomization test that reshuffles many times the data. If we click the \"Empirical distribution\" panel, we'll see the histogram of the randomized distribution of mean differences, with a red triangle showing the original sample difference. Manipulating the slider to change the number of randomizations will reconstruct the histogram. We can see that after 1000 randomization the distribution gets hyghly symmetrical. In general one can notice that the sample difference is far from being a typical value under the null hypothesis. The panel \"Results\" shows the sample means of females and males, the difference of mean(males)-mean(females), and the one-tailed p value, which is reactive to the number of randomizations, but it barely changes"))
	  		 
	  ))
	 


)
))