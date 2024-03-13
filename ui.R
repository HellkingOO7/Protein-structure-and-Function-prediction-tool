# Load required libraries
library(shiny)
library(seqinr)
library(bio3d)
library(httr)

# Define UI
ui <- fluidPage(
  titlePanel("Protein Structure Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("protein_name", "Enter Protein Name or Accession Number"),
      radioButtons("database", "Select Database",
                   choices = c("NCBI", "RCSB")),
      actionButton("download_sequence", "Download Sequence"),
      textAreaInput("sequence", "Paste Sequence (FASTA format)"),
      radioButtons("prediction_tool", "Select Prediction Tool",
                   choices = c("AlphaFold", "I-TASSER"))
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Structure Prediction", verbatimTextOutput("structure_output")),
        tabPanel("Function Prediction", verbatimTextOutput("function_output"))
      )
    )
  )
)
