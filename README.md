# docker-ansible-playbook
A container for running ansible-playbook

## Download
To use this container, pull the image from Docker Hub:
```bash
docker pull particledecay/ansible-playbook
```

## Usage
Run the container and pass any arguments you would normally pass to the `ansible-playbook` command:
```bash
docker run particledecay/ansible-playbook -i inv/myinventory.yml playbook.yml -vvv
```

## Customization
To override the default entrypoint (`/usr/bin/ansible-playbook`), add the `--entrypoint=` option to the `docker run` command:
```bash
docker run --entrypoint=/usr/bin/ansible particledecay/ansible-playbook -m setup all
```
If there are custom modules you would like included, you may bind mount your library dir into `/app/library`:
```bash
docker run --mount type=bind,src=${PWD}/library,dst=/app/library particledecay/ansible-playbook playbook.yml
```
