jupyter nbconvert --to html 'notebooks/comparison.ipynb' --TemplateExporter.exclude_input=True --execute
mv -f notebooks/comparison.html reports/comparison_report.html