docker build . -t lab4docker

docker run -it --name test-container --rm --mount source=test,target=/logi lab4docker