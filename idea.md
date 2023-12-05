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
