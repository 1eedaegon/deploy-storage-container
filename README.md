# deploy-storage-container
![most language](https://img.shields.io/github/languages/top/1eedaegon/deploy-storage-container)

Make storage with continer

* DB 컨테이너화를 위한 bash
* 빠르게 컨테이너를 받아 띄워서 환경을 조성하기 위해 작성
* 가장 최신화된 버전은 postgresql 버전
* 만약 PG-ADMIN 같은 서비스를 쓴다면 접속 시 docker-compose.yml에 있는 맵핑된 host 이름을 쓸 것.

## Getting started
1. Clone repo
```sh 
> git clone https://github.com/1eedaegon/deploy-storage-container
```
2. Update credential and file name
```sh
# !WARNING: THIS IS CREDENTIAL
> mv ./.env.sample .env 
```
3. Run deploy to compose
```sh
> ./01-deploy.sh
```
4. Stop and remove container process
```sh
> ./98_remove.sh
```
