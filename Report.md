### Issues Identified
1. Issue with DockerFile inside nginx and Python folder. 

    In the place of writing port values: Earlier user texted words. which is not the correct way to specify the port number
    We use numerical values to represent the port values. 

    So in-place of 
    `EXPOSE "eight thousand"`

    we should write: 

    `EXPOSE 8000`

2. Issue with DockerFile in Python folder.

    The versioning of the Python repo was not complete. 
    It works, but specifying the exact tag for the image is a better way to handle it. 

    The typo for `Workdir` specifying the folder was incorrect.
    Instead of `/appp` it should be `/app`. 

    Why such typo, as when we are copying the files, 
    we are copying inside the `/app` folder not the `/appp` folder. 
    So it can be both ways, we just need to update the name of the folder only at a one place.

    When copying the `app.py` file, we should specify the folder inside which the file is.
    So it should be a relative complete address. 

    Either `./app.py` or `Python/app.py`. To route correctly from the root folder. 

    While running the container, the pip version was old. So we needed to upgrade the pip version.
    We need to run this particular line.
    `RUN pip install --upgrade pip`
    This is very specific to the conatiner, and might not be required on using different images [more updated ones]

    When installing the dependecies for the `app.py` file, the name for the netifaces pages was wrongly types. 
    It should be `netifaces` not `netiface`.

    For the port name, it should be `8000` not `eight thousand`.

    In the `CMD ["python", "app.py"]` line. 
    The command python was typed incorrectly, 
    it was `pythn` instead of `python`.

3. Issue with DockerFile in nginx folder.

    `COPY nginx/nginx.conf /etc/nginx/nginx.conf` 
    Specifying the relative exact location of the file. 

    `COPY nginx/.html /usr/share/nginx/html`
    html file didn't existed. 

    Port should be specificed to be `80` instead of `eighty`.

4. Issue with docker-compose.yaml 

    - nginx: 

        image name, it should be correctly named. 
        Either of writing the locally-generated name for the image, we can use build command to directly link the Dockerfile for inside the designated folder.

        Port number: `"eighty:80"` ---> `80:80`

    - python-app
        
        image name: Instead of using the local image name, it's better to use the build command to build the python image directly from the dockerfile. 

        ```
        build:
            dockerfile: Python/Dockerfile
        ```

        ports: 8000:8000

        along with exposing the port, we need to link the port of the container to the port of local machine to have a communication channel between the localhost, and the container. 
        This will allow the sharing of the data. 

        When we expose the port, we are making it publicly available to the people, which can be used by the public url targetting specific port i.e. 8000

    
    - networks: 

        For `driver`, the typo for `brige` was incorrect. It was `bridg`. 
        The correct one is `bridge`. 

        And netwoks 
        `Property options is not allowed` inside the docker-compose file.
