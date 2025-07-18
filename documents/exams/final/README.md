# Take home final

EC320: Introduction to Econometrics Summer 2025 at the University of Oregon.

It is due on __07/18 @ 11:59p__

## Instructions

Unzip/extract the zip file.
An example of a file path to save this zip file in would be: `
~/Documents/classes/EC320/final/`).
Once unzipped, open the `EC320Su25_final.Rproj` which will open RStudio.

Navigate to the `Files` tab in the bottom right panel of RStudio.
You should see the following files:

```
.
├── EC320S25_final.Rproj
├── R
│   ├── final.rmd
├── README.md
└── data
    ├── downloaddata.R
    └── ipums_2022.csv

3 directories, 6 files

```

The assignment can be found in the `final.Rmd` file.
Complete the questions below and show all work.
You must submit a compiled html file with all code and answers in this document on Canvas.
Make sure to write your name above where it says "WRITE YOUR NAME HERE".
Include it within the quotation marks.

The total amount of points possible is 100.
You can find a table at the bottom of the document that denotes how points are allocated to each question.
Stay within the `tidyverse`, `broom`, and `here` packages.
You may not use other packages, although base R functions are allowed.
All code must be placed in code blocks and all regression estimates 
must be presented in a `broom` tidy format.

An example on how to use `broom` is provided in the questions. 

__Style Points__.
Good code should be easy to read and presentation is an important skill.
10 points on the exam are dedicated for style points.
Style points are determined by the following criteria:

- Your submission is organized and follows the directions

- Your written answers are clear

- Code is concise and easy to read.
It follows the principles of the tidyverse as introduced in koan assignments

- Plots are labelled and clearly presented

_Note_: Before answering the following questions,
make sure to compile the document to make sure that everything is working properly.
As you answer each question,
compile after each question to make sure you are not making any errors.
If you are experiencing an error, read the error carefully.
One tactic is to selectively delete questions/sections until the report compiles.
This will help you narrow down where the coding error is occurring.


#### Data

The data set used on this exam come from the 2022 American Community Survey (ACS),
which was downloaded from [IPUMS](https://ipums.org/).
At the bottom of this document,
you will find a table codebook that describes the variables in the data set.

#### Integrity
You are allowed to consult the lectures, notes, problem sets, quizzes,
and the internet on this assignment.
However, this is an individual assessment of your own understanding 
so you are are not permitted to collaborate with anyone else.
You may consult Stackoverflow, ChatGPT, other LLM models, etc. for help with R coding,
but you are responsible for understanding any code which you use to answer these questions.
All written answers must be your in your own words.

If you are suspected of plagiarizing,
you may recieve a zero for this assignment and possibly for the course.

