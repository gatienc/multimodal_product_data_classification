def show_token_distribution(X_train):
    def get_number_of_token(text):
        """word != token but number will be approximately equal"""
        text.split(" ")
        return (len(text))

    x = X_train['designation'].apply(get_number_of_token).tolist()
    y = X_train['description'].apply(get_number_of_token).tolist()
    fig = px.density_heatmap(x=x, y=y)
    fig.show()
