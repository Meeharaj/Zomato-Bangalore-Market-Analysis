# Cleaning the 'rate' column (e.g., '4.1/5', 'NEW', '-')

import numpy as np
def clean_rate(value):
    if pd.isna(value) or value == 'NEW' or value == '-':
        return np.nan
    else:
        value = str(value).split('/')[0] # Split '4.1/5' and keep '4.1'
        return float(value.strip())

zomato_df['rate'] = zomato_df['rate'].apply(clean_rate)


# Renaming the column as its contains '()' in the name 
zomato_df = zomato_df.rename(columns={'approx_cost(for two people)': 'approx_cost_for_two_people'})

# Cleaning 'approx_cost_for_two' (e.g., '1,200')
def clean_cost(value):
    if pd.isna(value):
        return np.nan
    else:
        value = str(value).replace(',', '') # Remove commas
        return float(value.strip())

zomato_df['approx_cost_two_people'] = zomato_df['approx_cost_two_people'].apply(clean_cost)

# Standardize text columns and booleans
zomato_df['online_order'] = zomato_df['online_order'].map({'Yes': True, 'No': False})
zomato_df['book_table'] = zomato_df['book_table'].map({'Yes': True, 'No': False})

#  Drop columns we won't need for core business analytics to save space
# (e.g., raw 'url' or 'phone' details)
zomato_df = zomato_df.drop(columns=['url', 'phone'], errors='ignore')

