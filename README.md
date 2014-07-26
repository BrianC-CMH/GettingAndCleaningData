### Running the script

- Clone this Github repository
- Download the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract the zip file in your R working directory. The extracted directory is a `UCI HAR Dataset` folder that has all the files and data sets required for analysis.
- Change working directory to the `UCI HAR Dataset` folder.
- Run `<working directory>/run_analysis.R`
- After executing, the tidy dataset is outputed as: `tidy.txt`
- Code book for the tidy dataset is available [here](code.book.md)


### Assumptions

- The training and test data are available in folders named `train` and `test`, respectively.
- For each of these data sets:
    - Measurements are present in `X_<test or train>.txt` file
    - Subject information is present in `subject_<test or train>.txt` file
    - Activity codes are present in `y_<test or train>.txt` file
- All activity codes and their labels are in a file named `activity_labels.txt`.
- Names of all measurements taken are present in file `features.txt` ordered and indexed as they appear in the `X_<dataset>.txt` files.
- All columns representing means contain `.Mean` in them.
- All columns representing standard deviations contain `.Std` in them.
