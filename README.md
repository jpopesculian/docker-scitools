# Scitools Docker Image

A Docker image for python3 with numpy, scipy and pandas packages already installed. This is to leverage all the LAPACK, BlAS, ATLAS bullshit as well as prevent really long build times for those packages. 

## Direct

```
docker pull jpopesculian/scitools
docker run -it jpopesculian/scitools /bin/bash
```

## Inherit

Create _Dockerfile_ in app directory

```
FROM jpopesculian/scitools

WORKDIR /app
ADD . /app

RUN pip3 install --upgrade -r /app/requirements.txt

EXPOSE 80

CMD []

ENTRYPOINT ["python3", "main.py"]
```