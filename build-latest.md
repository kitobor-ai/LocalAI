## Models

```
https://huggingface.co/nomic-ai
https://huggingface.co/BlinkDL
https://huggingface.co/concedo/
https://huggingface.co/skeskinen/
https://huggingface.co/ggerganov/
https://huggingface.co/imxcstar/
```

## Models Todo
```
https://huggingface.co/gpt2 (1.5 billion parameters.)
https://huggingface.co/EleutherAI/gpt-neo-2.7B (2.7 billion parameters)
https://huggingface.co/ctrl
https://huggingface.co/transformerxl-wt103 (sequence-to-sequence)
https://huggingface.co/t5-base (20 million parameters)
```

## Build

```
# install build dependencies
brew install cmake
brew install go

# clone the repo
git clone https://github.com/go-skynet/LocalAI.git

cd LocalAI

# build the binary
make build

# image generation
# make GO_TAGS=stablediffusion rebuild

# Download gpt4all-j to models/
wget https://gpt4all.io/models/ggml-gpt4all-j.bin -O models/ggml-gpt4all-j

# Use a template from the examples
cp -rf prompt-templates/ggml-gpt4all-j.tmpl models/

# Run LocalAI
./local-ai --models-path ./models/ --debug

# Now API is accessible at localhost:8080
curl http://localhost:8080/v1/models

curl http://localhost:8080/v1/chat/completions -H "Content-Type: application/json" -d '{
     "model": "ggml-gpt4all-j",
     "messages": [{"role": "user", "content": "How are you?"}],
     "temperature": 0.9 
   }'


curl http://localhost:8080/v1/completions -H "Content-Type: application/json" -d '{
     "model": "ggml-gpt4all-j",
     "prompt": "A long time ago in a galaxy far, far away",
     "temperature": 0.7
   }'
```

## Local

```

./local --models-path ../models --image-path ../images --context-size 700 --threads 4 --upload-limit 40
```

## Docker

```
docker ps
docker exec f38456758f00 ls

docker run -p 8080:8080 -ti --rm quay.io/go-skynet/local-ai:master --models-path /root/ai/models --image-path /root/ai/images --context-size 700 --threads 4 --upload-limit 40
```

## ENV

```
# Models ending with .bin
MODELS_PATH=/root/ai/models
CONFIG_FILE=/root/ai/configs
IMAGE_PATH=/root/ai/images
GO_TAGS=stablediffusion
# BUILD_TYPE=generic
# THREADS=4
# CONTEXT_SIZE=700
# ADDRESS=:8080
# UPLOAD_LIMIT=5MB
DEBUG=false
```

## BUILD_TYPE

```

Software acceleration.
Requirements: OpenBLAS (Windows x86/x86_64)
BUILD_TYPE=openblas

---

Nvidia Acceleration.
Requirement: Nvidia CUDA toolkit
BUILD_TYPE=cublas
CUDA_LIBPATH=

---

AMD/Intel GPU acceleration.
Requirement: OpenCL, CLBlast
make BUILD_TYPE=clblas build
CLBLAST_DIR=

---

Requirements: OpenCV, Gomp (Text to Image)
GO_TAGS=stablediffusion
```
