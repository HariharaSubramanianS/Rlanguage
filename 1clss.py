#nlp and wordcloud

import pandas as pd
import matplotlib.pyplot as plt
from wordcloud import WordCloud
import nltk
import string
from nltk.corpus import stopwords

nltk.download("stopwords")

df=pd.read_csv("dataset/yelp.csv")

def clean_text(text):
    text = text.lower()
    text = text.translate(str.maketrans('', '', string.punctuation))  # Remove punctuation
    tokens = text.split()
    tokens = [word for word in tokens if word not in stopwords.words('english')]  # Remove stopwords
    return " ".join(tokens)

# Apply to DataFrame
df['CleanText'] = df['ReviewText'].apply(clean_text)
print(df['CleanText'])

fake=" ".join(df[df["Label"]=="Fake"]["CleanText"])
Real=" ".join(df[df["Label"]=="Real"]["CleanText"])

fakewc=WordCloud(width=800,height=400,background_color="black",colormap="Reds").generate(fake)
realwc=WordCloud(width=800,height=400,background_color="white",colormap="Reds").generate(Real)

plt.subplot(1,2,1)
plt.imshow(fakewc)
plt.subplot(1,2,2)
plt.imshow(realwc)
plt.tight_layout()
plt.show()