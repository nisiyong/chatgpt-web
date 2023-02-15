# Build Image

```
cd chatgpt-web
docker build -t chatgpt-web -f docker/Dockerfile .
```

# Run Image

```bash
docker run --rm -it -p 80:3000 chatgpt-web
```
