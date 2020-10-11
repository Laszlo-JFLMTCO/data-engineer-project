# Requirement Analysis
The purpose of this page is to capture key details regarding the Requirement Analysis step.

## Key Details
### Input
Requires a specific list of input CSV files with specific filenames as defined below.
In order to collect all the necessary details for the models to support the required functionality, from the `the-movies-dataset.zip` file only two CSV files are really required to be present:
- `movies_metadata.csv`
- `ratings.csv` (its smaller subset: `ratings_small.csv` will be ignored)  

NOT necessary to support the required functionality are the following files:
- `credits.csv`
- `keywords.csv`
- `links_small.csv` (only smaller subset of `links.csv`)
- `links.csv`
### Output
One CSV file with header row per model (see `deliverables/data_model/README.md` for more details), where each row after the header row would represent required details for a single entry (row of that model) in the database.  
Decided against a single output file per database row as that would generate massive number of files. However it would provide better traceability for changes related to specific individual items.