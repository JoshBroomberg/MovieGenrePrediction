#!/bin/bash

### Prep data ###

# data access
python -m src.data.fetch_raw_movie_data

# data prep
python -m src.data.make_clean_movie_data
python -m src.data.make_genre_metadata

# features
python -m src.features.generate_vectorized_outcomes
python -m src.features.generate_count_features
# sh src/utils/get_word2vec.sh
python -m src.features.generate_word2vec_features

### Train and score all models ###
python -m src.utils.test_train_split

python -m src.models.svc
python -m src.models.naive_bayes
python -m src.models.neural_net

python -m src.scoring.score_models
bash src/report/comparison-report.sh

### Test, validate and deploy best model ###
python -m src.tests.test
bash src/report/validate-best-report.sh