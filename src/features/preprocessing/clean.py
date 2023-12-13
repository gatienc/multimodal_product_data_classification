import pandas as pd
import re

# Cleaning and Preprocessing Text


def clean_text(text):
    """
    Function to clean text data

    Parameters
    ----------
    text : str
        Text data to be cleaned

    Output
    ------
    text : str    


    """

    # Remove special characters and numbers
    text = re.sub(r'[^a-zA-ZäöüßÄÖÜ ]', '', text)
    # Convert text to lowercase
    text = text.lower()
    return text


def text_dataframes(filepath):
    """
    function to clean text data and return a dataframe

    Parameters
    ----------
    filepath : str
        Path to the csv file

    Output
    ------
    text_df : pandas dataframe
        Dataframe with cleaned text data
    """

    # Load data
    text_df = pd.read_csv(filepath, encoding='utf-8')
    text_df = text_df.drop(columns="Unnamed: 0")
    # Apply cleaning function to the 'designation' column

    text_df['designation'] = text_df['designation'].fillna(
        '').apply(clean_text)
