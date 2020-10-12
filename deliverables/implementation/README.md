# Deliverables - Implementation
The purpose of this page is to capture key details regarding the Implementation.

## Run The Implementation
### Prepare Local Environment
1. Navigate to the `deliverables/implementation` folder
2. Run the following command:
    ```
    bundle install
    ```
3. Run the following command in your terminal:
    ```
    ruby the_movies_parser.rb <DIRECTORY_OF_INPUT_CSV_FILES>
    ```

## Specific Features
### Input
This implementation assumes the followings regarding the input CSVs:
- preliminary checks for required input CSV files' presence has been completed
- preliminary checks of the input CSV files' integrity has been completed (files are not currupted, each has a header row, header rows have the required columns defined (unique list per input file), etc)
### Output
One CSV file with header row per model (see `deliverables/data_model/README.md` for more details), where each row after the header row would represent required details for a single entry (row of that model) in the database. => see `requirement_analysis/README.md` for additional details considered

## Known Limitations
### No Test for CLI
CLI input is only required to run it locally, `spec` folder does not have test for this feature.
### Low Test Coverage
Some unit tests were included to provide example for testing approach to be used for this implementation.