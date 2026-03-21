#python base image 
#slim is a stripped down version of the full Python image 
FROM python:3.11-slim

#setting the working directory inside the container. creates the directory if doesn't exist
WORKDIR /app 

#copying req.txt into container first. Before copying the rest of the code
COPY requirements.txt . 

#not caching inorder to keep the image smaller
RUN pip install --no-cache-dir -r requirements.txt 

#copying all the application code into the container 
COPY . . 

#just documenting that this container listens on port 5000
EXPOSE 5000 

#CMD commands run when the container starts. 
#uses json array format
#run commands directly withput a shell wrapper.
CMD ["python", "app.py"] 

