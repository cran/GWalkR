[English](README.md) | [中文](https://github.com/Kanaries/GWalkR/blob/main/docs/README.zh.md)

<img src="docs/img/hex_logo.png" align="right" alt="logo" width="120" height = "139" style = "border: none; float: right;">

# GWalkR: Your One-Stop R Package for Exploratory Data Analysis with Visualization

[![arxiv](https://img.shields.io/badge/arXiv-2406.11637-b31b1b.svg)](https://arxiv.org/abs/2406.11637)
[![CRAN
status](https://www.r-pkg.org/badges/version/GWalkR)](https://CRAN.R-project.org/package=GWalkR)
![](https://img.shields.io/github/actions/workflow/status/kanaries/GWalkR/web-app-build.yml?style=flat-square)
![](https://img.shields.io/github/license/kanaries/GWalkR?style=flat-square)
[![](https://img.shields.io/badge/twitter-kanaries_data-03A9F4?style=flat-square&logo=twitter)](https://twitter.com/kanaries_data)
[![](https://img.shields.io/discord/987366424634884096?color=%237289da&label=Discord&logo=discord&logoColor=white&style=flat-square)](https://discord.com/invite/WWHraZ8SeV)
[![](https://cranlogs.r-pkg.org/badges/GWalkR)](https://CRAN.R-project.org/package=GWalkR)

Start Exploratory Data Analysis (EDA) in R with a Single Line of Code!
[GWalkR](https://github.com/Kanaries/GWalkR) is an interactive Exploratory Data Analysis (EDA) Tool in R.
It integrates the htmlwidgets with [Graphic Walker](https://github.com/Kanaries/graphic-walker).
It can simplify your R data analysis and data visualization workflow, by turning your data frame into a Tableau-style User Interface for visual exploration.

<img width="1437" alt="image" src="https://github.com/Bruceshark/GWalkR/assets/33870780/26967dda-57c0-4abd-823c-63037c8f5168">

> If you prefer using Python, you can check out [PyGWalker](https://github.com/Kanaries/pygwalker)!

## Getting Started

### 📦 Setup GWalkR

```R
install.packages("GWalkR")
library(GWalkR)
```

### 📈 Start Your Data Exploration in a Single Line of Code

```R
data(iris)
gwalkr(iris)
```

### 🚀 Switch to Kernel Computation for Large Datasets

```R
gwalkr(large_df, kernelComputation = TRUE)
```

Here is a [tutorial](https://medium.com/@bruceyu0416/eda-reimagined-in-r-gwalkr-duckdb-for-lightning-fast-visualizations-05b011e8ae39) with more details.

Please note that the kernel mode will be running in a Shiny app which will block your R console. You can stop the app to use the console.

## Main Features
### Get an overview of your data frame under 'Data' tab.
<img width="700" alt="image" src="https://github.com/bruceyyu/GWalkR/assets/33870780/67131cfa-a25b-44ae-90a0-95902ea5edb1">

### Creat data viz with simple drag-and-drop operations.
<img width="700" alt="image" src="https://github.com/Bruceshark/GWalkR/assets/33870780/718d8ff6-4ad5-492d-9afb-c4ed67573f51">

### Find interesting data points? Brush them and zoom in!
<img width="700" alt="image" src="https://github.com/bruceyyu/GWalkR/assets/33870780/8033885d-3699-4f50-84e1-2201b3846b5a">

### Empower your R notebook (R Markdown).

Showcase your data insights with editable and explorable charts on a webpage ([example](https://rpubs.com/brky/1083643))!

<img width="700" alt="image" src="https://github.com/bruceyyu/GWalkR/assets/33870780/4798367c-0dd4-4ad3-b25b-7ea48b79205a">

## Development
We encourage developers from the amazing open-source community to help improve this R package! 

Because the built web library is not tracked by git, the source code here is not directly runnable. 
Please follow the steps below to run the source code on your own device:

1. Run `git clone https://github.com/Kanaries/GWalkR.git` to clone this repository.
2. Go to `/web_app` and `yarn install`.
3. You can now implement your features either in the web app by changing the TypeScript code, or in the R scripts under `/R`.
4. Run `yarn run build` to build the web app, and make sure the built library can be found under `/inst/htmlwidgets/lib/`.
5. In R Studio, run `devtools::load_all("{DIR_OF_GWALKR}")` to load the package (make sure you've removed the installed GWalkR from CRAN before that). 

For more information about R package development, please refer to this book, [*R Packages*](https://r-pkgs.org/).