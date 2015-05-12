library(shiny) 
library(formula.tools)
library(vegan)
data(mtcars)

modelAdjustedRsq  		<- function(fit) RsquareAdj(fit)$adj.r.squared
modelText  				<- function(input){
	predictors 			<- character()
	if(input$cyl!=0) 	predictors <- c(predictors, paste("I(cyl^",  as.character(input$cyl), ")"))
	if(input$disp!=0) 	predictors <- c(predictors, paste("I(disp^", as.character(input$disp), ")"))
	if(input$hp!=0) 	predictors <- c(predictors, paste("I(hp^",   as.character(input$hp), ")"))
	if(input$drat!=0) 	predictors <- c(predictors, paste("I(drat^", as.character(input$drat), ")"))
	if(input$wt!=0) 	predictors <- c(predictors, paste("I(wt^",   as.character(input$wt), ")"))
	if(input$qsec!=0) 	predictors <- c(predictors, paste("I(qsec^", as.character(input$qsec), ")"))
	if(input$vs!=0) 	predictors <- c(predictors, paste("I(vs^",   as.character(input$vs), ")"))
	if(input$am!=0) 	predictors <- c(predictors, paste("I(am^",   as.character(input$am), ")"))
	if(input$gear!=0) 	predictors <- c(predictors, paste("I(gear^", as.character(input$gear), ")"))
	if(input$carb!=0) 	predictors <- c(predictors, paste("I(carb^", as.character(input$carb), ")"))
	paste("mpg ~ ", paste(predictors, collapse=" + "), " + 1")
}

shinyServer( function(input, output) {
	model 				<- reactive(lm(as.formula(modelText(input)), data=mtcars))
	output$modelFitted  <- renderPrint(formula(model()))
	output$modelSummary <- renderPrint(summary(model()))
	output$modelAdjRsq 	<- reactive(round(modelAdjustedRsq(model()),8))
	output$diagPlot 	<- renderPlot({
		par(mfrow = c(1,4))
		plot(model())
	}) 
})

