FROM ubuntu

EXPOSE 80

# each RUN command creates a new layer in the Docker image. 
# For example, if you create an image that requires specific software or libraries installed, 
# you would use RUN to execute the necessary installation commands.
RUN apt update -y && apt install apache2 -y 

COPY ./src /var/www/html

# The CMD instruction specifies the default command to run when a container is started from the Docker image.
CMD [ "apache2ctl", "-DFOREGROUND" ]


# Containers are a tool to isolate a running application, and they run until the application that was launched exits. If this application is a shell or command that launches a daemon in the background like you've done, when the shell or command returns, the container will promptly exit.
# The solution is to run your application in the foreground. The steps to do this with Apache have already been done with the official images which I'd recommend using over building your own. You can see their Dockerfile here. And you can use their image on Dockerfile.

# CMD [ "service", "apache2", "start" ] 
