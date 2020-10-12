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

## Improvement/Refactoring Opportunities, Highlights
- Clearly specify character set supporting => input verification against that character set will have to be implemented
- hour/minute/second timestamps => Currently only date-based timestamps are generated as no hourly breakdown of any data was required  
- movie revenue is expected to be different for each day => if such information will become available, database relations are already in place to have a more accurate revenue numbers available  
- syntax how table column names are formed is consitent now vs the variety found in the input CSVs  
- maintain consistent timestamp formatting => convert to UTC once there is confirmation of the timezone of the provided timestamp input

## Known Limitations
### No Test for CLI
CLI input is only required to run it locally, `spec` folder does not have test for this feature.
### Low Test Coverage
Some unit tests were included to provide example for testing approach to be used for this implementation.
### Timestamp Format
The format of the timestamp in the `movie.csv` and the `popularity_vote.csv` output files are different