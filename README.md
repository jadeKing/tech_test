Tech test
Create a command line application where a borrower can enter in a requested loan amount
and get back a rate, monthly repayments & overall repayment figures.

User runs command with application file, file containing lender information and amount to be borrowed.
Input: application.rb market.csv 1500

Software validates file type, and that borrowed amount is between 1000 & 15000 in increments of 100.
Software is tested using Rspec

To run Software:

clone repo
cd into project file
type: quote_app.rb market.csv 1500

To test software:
clone repo
cd into project file
type: rspec spec/
