################################################
import nltk
nltk.download('words')
from nltk.corpus import words
################################################
setofwords = set(words.words())
################################################
def word_is_legal(word):
    return word in setofwords
################################################
print("potato: ", word_is_legal("potato"))
print("tomato: ", word_is_legal("tomato"))
print("zucchini: ", word_is_legal("zucchini"))
################################################
