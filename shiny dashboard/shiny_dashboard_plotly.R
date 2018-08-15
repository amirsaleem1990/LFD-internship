library(ggrepel)
library(shiny)
library(plotly)
library(reshape2)
library(shinythemes)
library(dplyr)

df = read.csv('~/Dropbox/sources/data.csv')
names(df)=c('samples','2000.01','2001.02','2002.03','2003.04','2004.05','2005.06','2006.07','2007.08','2008.09','2009.10','2010.11','2011.12','2012.13','2013.14','2014.15','2015.16','2016.17','2017.18','table')
df$table<-factor(df$table)
df$samples<-factor(df$samples)
ui = shinyUI(fluidPage(
  
  title = 'Pakistan Economic Servey',
  tags$br(),
  tags$img(src = 'http://www.lovefordata.com/wp-content/uploads/2016/05/Printable_Vector_File_2.png',
           height = 60,
           width = 125),
  # shinythemes::themeSelector(),
  
  tags$head(
    tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');"))),
  headerPanel(
    h1("Pakistan Economic Survey", 
       style = "font-family: 'Lobster', cursive;
       font-weight: 150; line-height: 1; 
       color: #4d3a7d;text-align: center")),
  sidebarLayout(
    sidebarPanel(width = 2,
                 selectizeInput("cnt", 
                                "Select Table:",
                                choices = levels(df$table),
                                selected = NULL),
                 selectizeInput("cnt2",
                                "Select samples:",
                                choices = c(),
                                selected = NaN,
                                multiple = TRUE)),
    mainPanel(plotlyOutput("plot")))))
server = function(input, output, session) {
  df <- melt(df, id = c("samples", "table"))
  subdf<<-data.frame()
  observeEvent(input$cnt,{
    test<-df[df$table==input$cnt,]
    subdf<<-test
    selections<-unique(test$samples)
    updateSelectInput(session,"cnt2",choices = selections)})
    output$plot = renderPlotly({
    plot.data <- subdf[subdf$samples %in% input$cnt2, ]

    plot_ly(data = plot.data, x = plot.data$variable, y = plot.data$value, color = plot.data$samples,type = 'scatter', mode = 'lines')%>% 
      add_markers() %>%
      layout(xaxis = list(
  title = "Years",
  titlefont = list(family = "Old Standard TT, serif",size = 20,color = "green"),
  showticklabels = TRUE,tickangle = 270
  ))
  })}
shinyApp(ui = ui, server = server)