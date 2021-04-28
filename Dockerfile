# install Python
FROM python:3.6-slim

# update the packages
RUN apt-get update -y && apt-get upgrade -y

# install GCC
RUN apt-get install -y gcc

# go to the default folder
WORKDIR /app

# copy the Python requirements
COPY requirements.txt requirements.txt

# install the Python requirements
RUN pip3 install -r requirements.txt

# set the notebook folder
WORKDIR /app/notebook

RUN jupyter notebook --generate-config

ARG NB_PWD

RUN sed -i "s/#c.NotebookApp.password = ''/c.NotebookApp.password = u'$NB_PWD'/g" /root/.jupyter/jupyter_notebook_config.py

# start the Jupyter notebook
CMD ["jupyter", "notebook", "--allow-root", "--ip=0.0.0.0"]
