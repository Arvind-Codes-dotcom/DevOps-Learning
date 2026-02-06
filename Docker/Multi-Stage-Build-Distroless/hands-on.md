# Multi-Stage Docker Builds & Distroless Runtime

## Goal of this lab

Understand:
- Why single-stage Docker builds create large images
- How multi-stage builds reduce image size drastically
- How scratch/distroless images improve security
- ENTRYPOINT behavior in minimal images

---

## Source
Folder used:
`Docker-Zero-to-Hero/examples/golang-multi-stage-docker-build`

---

## Step 1 — Build WITHOUT multi-stage (large image)

Go into:
`dockerfile-without-multistage`

```bash
docker build -t go-app-no-multistage .

Result: Image built successfully

## Step 2 — Build WITH multi-stage (tiny image)

From:
examples/golang-multi-stage-docker-build

docker build -t go-app-multistage .


Result: Image built successfully.

## Step 3 — Compare image sizes
docker images


My results:

Image	Content Size
go-app-no-multistage:latest	253MB
go-app-multistage:latest	1.21MB

✅ This shows a massive reduction in image size using multi-stage build.

## Step 4 — Verify ENTRYPOINT behavior (why args didn’t override)
docker inspect go-app-multistage --format='Entrypoint={{json .Config.Entrypoint}} Cmd={{json .Config.Cmd}}'


Output:

Entrypoint=["/app"] Cmd=null


Meaning:

The container always runs /app by default (ENTRYPOINT).

Any additional argument becomes input to /app.

## Step 5 — Prove the final image has no shell (scratch runtime)
docker run --rm -it --entrypoint /bin/sh go-app-multistage


Output (expected):

exec: "/bin/sh": stat /bin/sh: no such file or directory


✅ Confirms the final runtime image does not contain a shell/OS utilities.
This reduces attack surface and makes the container more secure.

## DevOps Takeaways

Multi-stage builds allow us to keep compilers/build tools only in the build stage.

The runtime stage can be minimal (scratch or distroless) for:

smaller images

faster pull/push

fewer vulnerabilities

improved production security