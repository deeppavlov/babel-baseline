# Baseline solution for DeepHack.Babel

The Docker container could be built with command:
```# cd babel-baseline && docker build -t {name} .```

## Run
To run the solution, run the following command:
```# docker run -v /path/to/data:/data -t {name}```

The folder you're mounting in previous command should contain file ```input.txt``` with sentences in English to translate. And it should *NOT* contain ```output.txt``` due to it will be rewritten during the run.
