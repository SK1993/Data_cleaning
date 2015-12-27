## The RScript does the following operations.

* Reads the Test and Training Datasets along with other required datasets
* Finds those columns in features file which are mean or std
* Retains only the above columns in both the test and control dataset
* Renames the above columns
* Renames the Subject and Activity datasets
* Column binds the 3 files of test dataset (same for training dataset)
* Row binds the test and training datasets
* Finds the required tidy dataset as the mean of all columns with respect to all Subjects and Activities.