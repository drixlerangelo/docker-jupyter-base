# Docker-enabled Jupyter Notebook Base Template
![GitHub](https://img.shields.io/github/license/drixlerangelo/docker-jupyter-base?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/drixlerangelo/docker-jupyter-base?style=flat-square)
## USAGE

1. Copy the given `.env.example` and rename it to `.env`.
2. Run `docker-compose up -d` to start the application.
3. In your browser, navigate to `localhost:8888`.
4. Enter the password: `secret`
5. Now it's ready to use!

## FAQS
1. Q: How to change the notebook's password?

   A: You can change the password by doing the following:

   (Note: You need to run this app at least once)
   1. Run:
        ```
        docker exec -it container_id /bin/sh
        ```
      Where the `container_id` is the assigned container ID for the application.
   2. Once in the container, you should open Python by entering `python`.
   3. Run:
        ```python
        >>> from notebook.auth import passwd
        >>> passwd()
        ```
    4. Enter the desired password.
    5. When done, it should return something like this:
        ```python
        'argon2:$argon2id$v=19$m=10240,t=10,p=8$0KakoN+Qvn3TQoE56KF63w$ZEEtq8KHz5VQTY7/VLRcTw' # secret
        ```
    6. Copy the string and assign it to the `NB_PWD` variable in the `.env` file.
2. Q: How to change the notebook's port?

   A: You can change the port by changing the `NB_PORT` in the `.env` file.
