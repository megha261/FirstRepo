import pandas as pd
dataframe1 = pd.read_csv("D:\Sales.csv")
dataframe2 = pd.read_csv("D:\Items.csv")


merged_df = pd. merge(dataframe1, dataframe2, on='ItemId')
print("merged dataframe",merged_df)
