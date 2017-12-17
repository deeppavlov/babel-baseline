# Baseline solution for DeepHack.Babel

## Build
The Docker container could be built with command:
```# cd babel-baseline && docker build -t {name} .```

## Run
To run the solution, run the following command:
```# docker run -v /path/to/input_data:/data -v /path/to/output:/output -t {name}```

The folder you're mounting in previous command (```input_data```) should contain file ```input.txt``` with sentences in English to translate. And the second forder (```output```) should *NOT* contain ```output.txt``` due to it will be rewritten during the run.

## Try
You could try to run container without building it, just pull it from docker hub:
```# docker pull madrugado/babel-baseline```

## Sumbission
Submission must be in form of zip-archive containing file [```meta.json```](./meta.json). The sample submission is included into repository as ```sample_submission.zip```.
