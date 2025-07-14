#Association rule mining

import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori,association_rules

df=pd.read_csv("dataset/supermarket_transactions.csv")
print(df)
transactions=df["Items"].apply(lambda x:x.split(","))
print(transactions)


te=TransactionEncoder()
te_data=te.fit_transform(transactions)
df_encoded=pd.DataFrame(te_data,columns=te.columns_)
print(df_encoded)

freq=apriori(df_encoded,min_support=0.05,use_colnames=True)
rule=association_rules(freq,metric="lift",min_threshold=1)

print(rule[["antecedents","consequents","support","confidence","lift"]].sort_values(by="lift",ascending=False).head(10))