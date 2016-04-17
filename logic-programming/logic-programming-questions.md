# **Logic/Programming (weight: 30%)**

## **In this section, you can use any programming language. You do NOT need a programming environment to compile and test code.**

**Copy the CSV data below into a file.**

```
Order #,Customer ID,Customer Name,Product SKU,Price,Purchase Date
2887123,114,Roger McHammer,111-783,$34.32,05/12/2013
2887124,115,Billy Balance,123-321,$22.12,05/12/2013
2887125,22,Cody Conroy,112-777,$8.89,05/12/2013
2887126,12,Steve Stevenson,109-009,$12.22,05/12/2013
2887127,45,Colt Mustang Jr.,176-543,$16.82,05/12/2013
2887128,32,Jill Ham,123-321,$22.12,05/12/2013
2887129,90,Missy Mackle,111-783,$34.32,05/13/2013
2887130,122,Combo Juarez,111-783,$34.32,05/13/2013
2887131,22,Cody Conroy,176-543,$16.82,05/13/2013
2887132,114,Roger McHammer,111-783,$34.32,05/13/2013
2887133,115,Billy Balance,123-321,$22.12,05/14/2013
2887134,24,Chet Baldry III,261-122,$109.11,05/14/2013
2887135,33,Ken Washington,111-783,$34.32,05/14/2013
2887136,151,Maria Melendez,222-333,$90.10,05/14/2013
2887137,32,Jill Ham,111-784,$47.67,05/14/2013
2887138,45,Colt Mustang Jr.,892-233,$78.32,05/15/2013
2887139,114,Roger McHammer,111-784,$47.67,05/15/2013
2887140,6,Jud Gofferton,678-903,$0.23,05/15/2013
```

**Create a program that will extract the data from the CSV file and perform the following operations:**

- **Organize and sort the data by customer name.**
- **Calculate the total number of orders per customer.**
- **Calculate the average cost of orders per customer.**

**Once the CSV has been loaded into a data model, create a report file containing the desired information from above in either JSON or XML format. You may use built-in JSON or XML libraries, and other built-in functions like sorting & searching in the language of your choice. (This includes using pseudo code.)**


Ran out of time before I could flesh out the answer for this question.

At a glance, I would like to use ruby and do something like:

1. Create the tests for the requirements in this question (using rspec or minitest)
..1. Sort feature
..1. Secondary sort feature
..1. Cost cruncher
1. Create the CSV file to be read in.  Call it data.csv.
1. Create the solution:

     require csv


     read in the csv
     data.csv = CSV.read 'data.csv'

     then use def for csv sorts
     then use def for calculation 

