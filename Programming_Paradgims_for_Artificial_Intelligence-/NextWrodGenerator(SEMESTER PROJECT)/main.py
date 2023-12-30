import numpy as np
import time
import pickle
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.utils import to_categorical

class TextGenerator:
    def __init__(self, text, max_sequence_len=50):
        self.tokenizer = Tokenizer()
        self.max_sequence_len = max_sequence_len
        self.text = text
        self.model = self._build_model()

    def _tokenize_text(self):
        self.tokenizer.fit_on_texts([self.text])
        input_sequences = []
        for sentence in self.text.split('\n'):
            tokenized_sentence = self.tokenizer.texts_to_sequences([sentence])[0]
            for i in range(1, len(tokenized_sentence)):
                input_sequences.append(tokenized_sentence[:i + 1])

        padded_input_sequences = pad_sequences(input_sequences, maxlen=self.max_sequence_len, padding='pre')
        X = padded_input_sequences[:, :-1]
        y = padded_input_sequences[:, -1]
        y = to_categorical(y, num_classes=len(self.tokenizer.word_index) + 1)
        return X, y

    def _build_model(self):
        X, y = self._tokenize_text()

        model = Sequential()
        model.add(Embedding(len(self.tokenizer.word_index) + 1, 100, input_length=self.max_sequence_len - 1))
        model.add(LSTM(150))
        model.add(Dense(len(self.tokenizer.word_index) + 1, activation='softmax'))
        model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
        model.fit(X, y, epochs=100)
        return model

    def generate_text(self, seed_text, num_words_to_generate):
        text = seed_text.lower()

        for _ in range(num_words_to_generate):
            token_text = self.tokenizer.texts_to_sequences([text])[0]
            padded_token_text = pad_sequences([token_text], maxlen=self.max_sequence_len - 1, padding='pre')
            pos = np.argmax(self.model.predict(padded_token_text))

            for word, index in self.tokenizer.word_index.items():
                if index == pos:
                    text = text + " " + word
                    print(text)
                    time.sleep(2)

    def save_to_pickle(self, filename):
        with open(filename, 'wb') as file:
            pickle.dump(self, file)

    def load_faq_text_from_file(file_path):
        with open(file_path, 'r') as file:
            return file.read()

    @staticmethod
    def load_from_pickle(filename):
        with open(filename, 'rb') as file:
            return pickle.load(file)

train_data = TextGenerator.load_faq_text_from_file('data.txt')

text_gen = TextGenerator(train_data)
text_gen.generate_text("what is the fee", 10)

text_gen.save_to_pickle('text_generator.pkl')

loaded_text_gen = TextGenerator.load_from_pickle('text_generator.pkl')
loaded_text_gen.generate_text("Will Deep Learning and NLP", 10)