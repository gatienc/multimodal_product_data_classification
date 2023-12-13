## Text preprocessing

how to embed the text data, there is at the same time the title of the product and also the description of the product. ( 2 different texts) how to bind them together ?
!!Description of the product is often missing

I think that big word embedding framework as Bert will maybe not be the best solution because the text data use a particular vocabulary and the description of the product is often missing. So I think that a word embedding framework that is trained on the text data of the product will be better.

[Introduction to word tokenisation](https://scikit-learn.org/stable/tutorial/text_analytics/working_with_text_data.html)

[Word embedding](https://machinelearningmastery.com/what-are-word-embeddings/)

Embedding libraries we could use:

- gensim
- NLTK

first, let's try with a basic bag of words

### Upgrade pre-processing

there is date and time in the text data, while we can't just keep it as it is, we can extract the date and time and replace it by a token. For example, replacing every date possible by the token "DATE" and every time possible by the token "TIME". We can also replace every number by the token "NUMBER".

this could help to classify when there is for example a Serial number or some collection object have a date in their name.
