## Models

```
https://huggingface.co/nomic-ai
https://huggingface.co/BlinkDL
https://huggingface.co/concedo/
https://huggingface.co/skeskinen/
https://huggingface.co/ggerganov/
https://huggingface.co/imxcstar/
```

## Curl

```
curl http://localhost:8080/v1/models

curl https://gpt4all.io/models/ggml-gpt4all-j.bin -o ggml-gpt4all-j.bin
or
wget <https://gpt4all.io/models/ggml-gpt4all-j.bin> -O ggml-gpt4all-j.bin

curl http://localhost:8080/v1/completions -H "Content-Type: application/json" -d '{
     "model": "ggml-gpt4all-j.bin",
     "prompt": "A long time ago in a galaxy far, far away",
     "temperature": 0.7
   }'


curl http://localhost:8080/v1/chat/completions -H "Content-Type: application/json" -d '{
     "model": "ggml-gpt4all-j.bin",
     "messages": [{"role": "user", "content": "How are you?"}],
     "temperature": 0.9 
   }'
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
Default
BUILD_TYPE=generic

Requirements: OpenBLAS (Windows x86/x86_64)
BUILD_TYPE=openblas

Requirement: Nvidia CUDA toolkit
BUILD_TYPE=cublas

Requirements: OpenCV, Gomp (Text to Image)
GO_TAGS=stablediffusion
```

## Info

```
lscpu
sudo chown -R $(whoami) ~/.docker
/var/lib/docker

docker images
docker image rm REPOSITORY
```
