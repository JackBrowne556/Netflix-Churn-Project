# Excel Formulas

### Below are the excel functions used during the data cleaning process, outlined in the data_cleaning_notebook. 

#### Blank and Null values: Customer_id

(1) =RIGHT(A3,6)
(2) =IF(OR(K3="", K3="###"), TEXT(K2+1, "000000"), K3)
(3) =CONCATENATE("C", 03)

#### Typo values: 

Region - =IFERROR(VLOOKUP(D2,$R$1:$S$106,2,FALSE), D2)

Sub_plan - =IFERROR(VLOOKUP(E2, lookups!$D$1:$E$64,2,FALSE), E2)

churn_status - =IFERROR(VLOOKUP(E2,lookups!$G$1:$H$16,2,FALSE), E2)

`Image of Lookup table for all three in single screenshot`

#### Return basic or standard_with_ads plan values in new column

(1) =IFS(ISBLANK(G2), D2, ISBLANK(D2), G2)

#### Find Regions from Countries Temporary lookup table 

(1) =VLOOKUP(I2, lookups!$A$1:$B$244, 2, FALSE)
