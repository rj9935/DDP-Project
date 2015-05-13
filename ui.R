library(shiny)

shinyUI(navbarPage("Modelling mpg performance",
				   tabPanel("Model",
				   		 sidebarLayout(
				   		 	sidebarPanel(
				   		 		submitButton('Fit!'),
				   		 		h3('Model controls'),
				   		 		sliderInput("cyl",   "Cylinders:",     min = -5, max = 5, value = 0, step = 0.25), 
				   		 		sliderInput("disp",  "Displacement:",  min = -5, max = 5, value = 1, step = 0.25), 
				   		 		sliderInput("hp",    "Horsepower:",    min = -5, max = 5, value = 0, step = 0.25), 
				   		 		sliderInput("drat",  "D-ratio:",       min = -5, max = 5, value = 0, step = 0.25), 
				   		 		sliderInput("wt",    "Weight:",        min = -5, max = 5, value = 0, step = 0.25), 
				   		 		sliderInput("qsec",  "1/4 Mile time:", min = -5, max = 5, value = 0, step = 0.25), 
				   		 		sliderInput("vs",    "V/S Alignment:", min =  0, max = 1, value = 0, step = 1.00), 
				   		 		sliderInput("am",    "Transmission:",  min =  0, max = 1, value = 0, step = 1.00), 
				   		 		sliderInput("gear",  "Gears:",         min = -5, max = 5, value = 0, step = 0.25), 
				   		 		sliderInput("carb",  "Carburettors:",  min = -5, max = 5, value = 0, step = 0.25) 
				   		 	),
				   		 	mainPanel(
				   		 		h3('Model fitted:'), 
				   		 		verbatimTextOutput("modelFitted"),		
				   		 		h3('Adjusted R-squared:'), 
				   		 		verbatimTextOutput("modelAdjRsq"),
				   		 		h3('Diagnostic plots:'),
				   		 		plotOutput('diagPlot'),
				   		 		h3('Summary fit:'), 
				   		 		verbatimTextOutput("modelSummary")
				   		 	)
				   		 )
				   ),
				   tabPanel("Help",
				   		 sidebarLayout(
				   		 	sidebarPanel(
				   		 		h3('Model controls'),
				   		 		p("This shiny app allows you to quickly and easily assess different models for mpg performance in the mtcars dataset."),
				   		 		br(),
				   		 		p("Use the slider bars to adjust the exponents for the predictors to include in the model."),
				   		 		br(),
				   		 		p("If you don't want a predictor to be included just set its exponent value to zero."),
				   		 		br(),
				   		 		p("When you're happy with your model, just hit the [Fit!] button (top left of side panel) to see the results."),
				   		 		br(),
				   		 		p("The results will appear automatically in the main panel on the right hand side.")	 		
				   		 	),
				   		 	mainPanel(
				   		 		h3('Model results'), 
				   		 		br(),
				   		 		h4('Model fitted:'), 
				   		 		p("This box contains the model fitted in the format:  mpg ~ I(pred1^exp1) + I(pred2^exp2) + ... etc."),
				   		 		br(),
				   		 		h4('Adjusted R-squared:'), 
				   		 		p("This box contains the value of the adjusted R-squared for your model, the closer you got to 1.0 the better you did!"),
				   		 		br(),
				   		 		h4('Diagnostic plots:'),
				   		 		p("This area contains the standard diagnostic plots for your model."),
				   		 		br(),
				   		 		h4('Summary fit:'), 
				   		 		p("This box contains the standard summary text data for your model.")
				   		 	)
				   )
			)
	)

)