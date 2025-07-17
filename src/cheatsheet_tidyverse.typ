#import "./templates/conf.typ": *

#show: template.with(
  title: "Seurat 치트 시트",
  header: [#datetime.today().display()],
  footer: "https://satijalab.org/seurat/articles/essential_commands.html",
)

// 여기에 문서 내용을 작성하세요

= Introduction to the Tidyverse

The data science life cycle begins with a question that can be answered with data and ends with an answer to that question. However, there are a lot of steps that happen after a question has been generated and before arriving at an answer. After generating their specific question, data scientists have to determine what data will be useful, import the data, tidy the data into a format that is easy to work with, explore the data, generate insightful visualizations, carry out the analysis, and communicate their findings. Throughout this process, it is often said that 50-80% of a data scientist’s time is spent wrangling data. It can be hard work to read the data in and get data into the format you need to ultimately answer the question. As a result, conceptual frameworks and software packages to make these steps easier have been developed.

Within the R community, R packages that have been developed for this very purpose are often referred to as the Tidyverse. According to their website, the tidyverse is “an opinionated collection of R packages designed for data science. All packages share an underlying design philosophy, grammar, and data structures.” There are currently about a dozen packages that make up the official tidyverse; however, there are dozens of tidyverse-adjacent packages that follow this philosophy, grammar, and data structures and work well with the official tidyverse packages. It is this whole set of packages that we have set out to teach in this specialization.

In this course, we set out to introduce the conceptual framework behind tidy data and introduce the tidyverse and tidyverse-adjacent packages that we’ll be teaching throughout this specialization. Mastery of these fundamental concepts and familiarity with what can be accomplished using the tidyverse will be critical throughout the more technical courses ahead. So, be sure you are familiar with the vocabulary provided and have a clear understanding of the tidy data principles introduced here before moving forward.

In this specialization we assume familiarity with the R programming language. If you are not yet familiar with R, we suggest you first complete R Programming before returning to complete this specialization. However, if you have some familiarity with R and want to learn how to work more efficiently with data, then you’ve come to the right place!

== Tidy Data
Before we can discuss all the ways in which R makes it easy to work with tidy data, we have to first be sure we know what tidy data are. Tidy datasets, by design, are easier to manipulate, model, and visualize because the tidy data principles that we’ll discuss in this course impose a general framework and a consistent set of rules on data. In fact, a well-known quote from Hadley Wickham is that “tidy datasets are all alike but every messy dataset is messy in its own way.” Utilizing a consistent tidy data format allows for tools to be built that work well within this framework, ultimately simplifying the data wrangling, visualization, and analysis processes. By starting with data that are already in a tidy format or by spending the time at the beginning of a project to get data into a tidy format, the remaining steps of your data science project will be easier.

==  Tidy Data Benefits

There are a number of benefits to working within a tidy data framework:

+ Tidy data have a consistent data structure - This eliminates the many different ways in which data can be stored. By imposing a uniform data structure, the cognitive load imposed on the analyst is minimized for each new project.
+ Tidy data foster tool development - Software that all work within the tidy data framework can all work well with one another, even when developed by different individuals, ultimately increasing the variety and scope of tools available, without requiring analysts to learn an entirely new mental model with each new tool.
+ Tidy data require only a small set of tools to be learned - When using a consistent data format, only a small set of tools is required and these tools can be reused from one project to the next.
+ Tidy data allow for datasets to be combined - Data are often stored in multiple tables or in different locations. By getting each table into a tidy format, combining across tables or sources becomes trivial.

===  Rules for Storing Tidy Data

In addition to the four tidy data principles, there are a number of rules to follow when entering data to be stored, or when re-organizing untidy data that you have already been given for a project into a tidy format. They are rules that will help make data analysis and visualization easier down the road. They were formalized in a paper called “Data organization in spreadsheets”, written by two prominent data scientists, Karl Broman and Kara Woo. In this paper, in addition to ensuring that the data are tidy, they suggest following these guidelines when entering data into spreadsheets:

- Be consistent
- Choose good names for things
- Write dates as YYYY-MM-DD
- No empty cells
- Put just one thing in a cell
- Don’t use font color or highlighting as data
- Save the data as plain text files

We’ll go through each of these to make sure we’re all clear on what a great tidy spreadsheet looks like.

= Wrangling Data in the Tidyverse
In the last course we spent a ton of time talking about all the most common ways data are stored and reviewed how to get them into a tibble (or data.frame) in R.

So far we’ve discussed what tidy and untidy data are. We’ve (hopefully) convinced you that tidy data are the right type of data to work with. What we may not have made perfectly clear yet is that data are not always the tidiest when they come to you at the start of a project. An incredibly important skill of a data scientist is to be able to take data from an untidy format and get it into a tidy format. This process is often referred to as data wrangling. Generally, data wranglings skills are those that allow you to wrangle data from the format they’re currently in into the tidy format you actually want them in.

Beyond data wrangling, it’s also important to make sure the data you have are accurate and what you need to answer your question of interest. After wrangling the data into a tidy format, there is often further work that has to be done to clean the data.

== Tidy Data Review
Before we move any further, let’s review the requirements for a tidy dataset:

- Each variable is stored in a column
- Each observation is stored in a row
- Each cell stores a single value

We had four tidy data principles in an earlier lesson, where the fourth was that each table should store a single type of information. That’s less critical here, as we’ll be working at first with single datasets, so let’s just keep those three tidy data principles at the front of our minds.

== Reshaping Data
Tidy data generally exist in two forms: wide data and long data. Both types of data are used and needed in data analysis, and fortunately, there are tools that can take you from wide-to-long format and from long-to-wide format. This makes it easy to work with any tidy dataset. We’ll discuss the basics of what wide and long data are and how to go back and forth between the two in R. Getting data into the right format will be crucial later when summarizing data and visualizing it.

=== Wide Data
Wide data has a column for each variable and a row for each observation. Data are often entered and stored in this manner. This is because wide data are often easy to understand at a glance.

=== Long Data
Long data, on the other hand, has one column indicating the type of variable contained in that row and then a separate row for the value for that variable. Each row contains a single observation for a single variable.

== Working With Factors
In R, categorical data are handled as factors. By definition, categorical data are limited in that they have a set number of possible values they can take. For example, there are 12 months in a calendar year. In a month variable, each observation is limited to taking one of these twelve values. Thus, with a limited number of possible values, month is a categorical variable. Categorical data, which will be referred to as factors for the rest of this lesson, are regularly found in data. Learning how to work with this type of variable effectively will be incredibly helpful.

To make working with factors simpler, we’ll utilize the `forcats` package, a core tidyverse package. All functions within `forcats` begin with `fct_`, making them easier to look up and remember. As before, to see available functions you can type `?fct_` in your RStudio console. A drop-down menu will appear with all the possible `forcats` functions.

In R, factors are comprised of two components: the actual values of the data and the possible levels within the factor. Thus, to create a factor, you need to supply both these pieces of information.

For example, if we were to create a character vector of the twelve months, we could certainly do that:

```r
## all 12 months
all_months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

## our data
some_months <- c("Mar", "Dec", "Jan",  "Apr", "Jul")
```

However, if we were to sort this vector, R would sort this vector alphabetically.

```r
# alphabetical sort
sort(some_months)
## [1] "Apr" "Dec" "Jan" "Jul" "Mar"
```

While you and I know that this is not how months should be ordered, we haven’t yet told R that. To do so, we need to let R know that it’s a factor variable and what the levels of that factor variable should be.


```r
# create factor
mon <- factor(some_months, levels = all_months)
# look at factor
mon
## [1] Mar Dec Jan Apr Jul
## Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
# look at sorted factor
sort(mon)
## [1] Jan Mar Apr Jul Dec
## Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
```



= Easier analysis with the tidyverse
// https://bookdown.org/marius_mather/Rad/tidyverse.html

Now that you know the basics of R, it’s time to learn that there are much better ways to do everything you just learnt!

== Introduction to the tidyverse

The tidyverse is a bundle of packages that make using R easier because they’re all designed to work together. Most “tidy” functions work well together because they:

- Take a dataframe as their input
- Return as dataframe as their output

You might not use every package from the tidyverse in an analysis, but you can still load them all at the start of most analyses, and know you’ll have a standard set of tools available. To load them all, just use:

```r
library(tidyverse)
cow = carData::Cowles
```

== dplyr: Turning complex analyses into simple steps

As your analyses get more complicated, your code can get more complicated as well. To get to the answers you want, you might have to:

- Drop certain rows from your dataset because they’re invalid or not relevant.
- Calculate stats for each treatment group separately.
- Use summary variables like the school mean to calculate a standardized score.

and more importantly, you might have to combine multiple different operations like these for each calculation you’re doing.

The `dplyr` package in the tidyverse makes this easier by providing a small number of simple verbs that can be combined easily to perform complex tasks. Each one takes your current data, changes it, and returns it. The most common verbs you’ll use are:

- `filter()`: choose rows to keep based on a logical test, dropping the rest.
- `arrange()`: sort the data.
- `select()`: choose columns to keep.
- `mutate()`: add new columns.
- `summarize()`: create columns that summarise the data down to a single row.
- `count()`: Count the number of rows in the data.
- `left_join()` (and `right_join()`, `inner_join()` etc.): Merge datasets based on a common identifier.

And, possibly most importantly:

- group_by(): Split the data into groups, so that any subsequent steps happen separately for each group.

We will go over examples of all of these below.

== Bending the rules: Non-standard evaluation

dplyr and other tidyverse packages bend the rules of R syntax, allowing you to just type column names like group and time rather than having to spell out the name of the dataframe each time (like `survey1$group`, `survey1$time`). Within tidyverse function calls you can just type the column name, e.g.


```r
cow %>%
    # Within the brackets, no $ needed
    count(sex, volunteer)
## # A tibble: 4 x 3
##   sex    volunteer     n
##   <fct>  <fct>     <int>
## 1 female no          431
## 2 female yes         349
## 3 male   no          393
## 4 male   yes         248
```

== Common tasks with dplyr

Selecting columns with `select`

You can select particular columns from a dataframe using `select()`. Using - in front of a column name excludes that column:

```r
# These both give the same result: inclusion vs. exclusion
cow %>%
    select(neuroticism, extraversion) %>%
    head(2)
##   neuroticism extraversion
## 1          16           13
## 2           8           14
cow %>%
    select(-sex, -volunteer) %>%
    head(2)
##   neuroticism extraversion
## 1          16           13
## 2           8           14
```

Instead of column names, you can also use a range of helper functions like `starts_with()` and `num_range()` to select multiple columns that match a particular pattern.

=== Creating/changing columns with mutate

We can use mutate on a dataframe to add or change one or more columns:

```r
cow %>%
    # high_extraversion and high_neuroticism are the names
    #   of new columns that will be created
    mutate(high_extraversion = extraversion >= 15,
           high_neuroticism = neuroticism >= 15) %>%
    head()
##   neuroticism extraversion    sex volunteer high_extraversion
## 1          16           13 female        no             FALSE
## 2           8           14   male        no             FALSE
## 3           5           16   male        no              TRUE
## 4           8           20 female        no              TRUE
## 5           9           19   male        no              TRUE
## 6           6           15   male        no              TRUE
```

If we want these changes to be saved, we would need to save the result back to the original variable. By default, `mutate()` will just return an altered copy of the original data, but won’t change the original:

```r
# If we want to actually save the changes
cow = cow %>%
    mutate(high_extraversion = extraversion >= 15,
           high_neuroticism = neuroticism >= 15)
```

On its own, the main advantage mutate offers is being able to spell out your calculations without including the name of the dataframe. However, it can be very useful in combination with other verbs.

== Summarizing the data with summarize
summarize is similar to mutate: it adds or changes columns. However, summarize also collapses the data down to a single row, so the values you calculate need to be single values like means or counts.

```r
cow %>%
    summarize(
        extraversion = mean(extraversion),
        volunteers = sum(volunteer == "yes")
    )
##   extraversion volunteers
## 1     12.37298        597
```

summarize is useful in combination with group_by, where it collapses the data down to one row per group.

== Selecting rows with filter

Choosing rows with a logical test with `filter()` works just like subsetting your data with a logical vector, it’s just easier to do it as part of a sequence of steps:

```r
cow %>%
  filter((sex == "male") & (volunteer == "yes")) %>%
  head()
##   neuroticism extraversion  sex volunteer
## 1          17           19 male       yes
## 2           7           15 male       yes
## 3          17           12 male       yes
## 4           6           13 male       yes
## 5           8            9 male       yes
## 6           5           16 male       yes
```

== Sorting with arrange
With arrange, you can sort by one or more columns. Use desc(column) (short for descending) to sort that column in the opposite direction:

```r
cow %>%
  arrange(sex, volunteer, desc(extraversion)) %>%
  head()
##   neuroticism extraversion    sex volunteer
## 1          15           23 female        no
## 2          15           21 female        no
## 3           9           21 female        no
## 4          10           21 female        no
## 5           8           20 female        no
## 6           5           20 female        no
```

== group_by for calculations within groups

`group_by()` is very useful for calculating different stats in subgroups of your data. This covers a lot of the more complex operations you might need to do with your data, so it unlocks a lot of possibilities.

You can do things like:

- Mean-centering scores separately for males and females:

```r
cow %>%
    group_by(sex) %>%
    mutate(
        extraversion_centered = extraversion - mean(extraversion)
    )
## # A tibble: 1,421 x 5
## # Groups:   sex [2]
##    neuroticism extraversion sex    volunteer extraversion_centered
##          <int>        <int> <fct>  <fct>                     <dbl>
##  1          16           13 female no                        0.578
##  2           8           14 male   no                        1.69
##  3           5           16 male   no                        3.69
##  4           8           20 female no                        7.58
```

- calculating means and SDs for subgroups:

```r
cow %>%
    group_by(sex, volunteer) %>%
    summarise(mean = mean(neuroticism),
              sd = sd(neuroticism))
## # A tibble: 4 x 4
## # Groups:   sex [2]
##   sex    volunteer  mean    sd
##   <fct>  <fct>     <dbl> <dbl>
## 1 female no         12.2  4.75
## 2 female yes        12.3  4.79
## 3 male   no         10.5  4.75
## 4 male   yes        10.4  5.11
```

== frequency tables with count
`count()` gives you a straightforward way to create a frequency table. There’s no built-in way to calculate percentages, but you can easily add them using mutate():


```r
cow %>%
    count(sex) %>%
    # count creates a column called 'n'
    mutate(percent = n / sum(n) * 100)
## # A tibble: 2 x 3
##   sex        n percent
##   <fct>  <int>   <dbl>
## 1 female   780    54.9
## 2 male     641    45.1
```

If you have multiple levels of grouping, you need to think about how you want to calculate percentages. To get the percentage who volunteered within each sex:

```r
cow %>%
    count(sex, volunteer) %>%
    group_by(sex) %>%
    mutate(percent = n / sum(n) * 100)
## # A tibble: 4 x 4
## # Groups:   sex [2]
##   sex    volunteer     n percent
##   <fct>  <fct>     <int>   <dbl>
## 1 female no          431    55.3
## 2 female yes         349    44.7
## 3 male   no          393    61.3
## 4 male   yes         248    38.7
```

===  Merging data with left_join()
To combine two dataframes, you can use functions like `left_join()` and `inner_join()`. In my experience, `left_join()` is what you want most of the time. To merge data successfully, all you need is a column that’s present in both datasets that they can be matched on, usually a participant ID or something similar.

Joins can also be useful when you have to calculate a complex summary. You can create a separate table with the summary info, and merge it back into the main dataset. As a simple example, let’s summarize extraversion by both sex and volunteering status and merge it back into the main dataset:

```r
extraversion_info = cow %>%
    group_by(sex, volunteer) %>%
    summarize(mean_extraversion = mean(extraversion))

extraversion_info
## # A tibble: 4 x 3
## # Groups:   sex [2]
##   sex    volunteer mean_extraversion
##   <fct>  <fct>                 <dbl>
## 1 female no                     12.0
## 2 female yes                    12.9
## 3 male   no                     11.9
## 4 male   yes                    12.9
cow %>%
  left_join(extraversion_info, by = c("sex", "volunteer")) %>%
  head()
##   neuroticism extraversion    sex volunteer mean_extraversion
## 1          16           13 female        no          12.00696
## 2           8           14   male        no          11.91349
## 3           5           16   male        no          11.91349
## 4           8           20 female        no          12.00696
## 5           9           19   male        no          11.91349
## 6           6           15   male        no          11.91349
```
